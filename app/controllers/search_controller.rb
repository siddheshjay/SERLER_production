class SearchController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_search, only: [:index]
  before_action :set_search_conditions, only: [:show]
  skip_before_action :authenticate_user!

  def index
  end

  def create
    @search = Search.new()
    @search.name = search_params[:name] if search_params[:name]

    fields_params.keys.each do |key|
      fields = fields_params[key]
      fields.delete_if {|x| x.to_s == "_destroy" }
      @search.search_fields.build(fields)
    end

    if @search.save!
      render json: {success: true}
    else
      render json: {success: false}, status: 400
    end
  end

  def history
    @searches = Search.all
  end

  def show
  end

  private
  def search_params
    if params.include?(:search)
      params.require(:search).permit(:id, :from_date, :to_date, :name, :saved_on,
                                     :search_fields_attributes => [:content,:field,:op1,:op2,:_destroy]);
    else
      params.permit(:id)
    end
  end

  def fields_params
    search_params[:search_fields_attributes]
  end

  def set_search
    if search_params[:search_fields_attributes]
      @search = Search.new(search_params)

      if(@search.search_fields.blank?)
        @search.search_fields.build(search_params[:search_fields_attributes][0])
      end

      #search_scope = make_query params
      #@results = search_scope.call(EvidenceSource)
      set_search_conditions
    else
      @search = Search.new
      if @search.search_fields.blank?
        @search.search_fields.build
      end
      @results = []
    end
  end

  def set_search_conditions
    if search_params[:id]
      @search = Search.find(search_params[:id])
    else
      @search = Search.new(search_params)
    end

    query_string = ""
    query_author = false

    @search.search_fields.each do |search_field|
      unless search_field.content.blank?
        query_string << "#{search_field.op1} " unless query_string.blank?
        query_string << "#{search_field.field} "
        query_string << "#{search_field.op2} "

        query_author = true if search_field.field == "name" or search_field.field == "name_abbr"

        if search_field.op2 == "=" || search_field.op2 == ">" || search_field.op2 == "<"
          query_string << "'#{search_field.content}' "
        else
          query_string << "'%#{search_field.content}%' "
        end
      end
    end

    unless @search.from_date.blank?
      query_string << "AND " unless query_string.blank?
      query_string << "published_time >= "
      query_string << "'#{@search.from_date}' "
    end

    unless @search.to_date.blank?
      query_string << "AND " unless query_string.blank?
      query_string << "published_time <= "
      query_string << "'#{@search.to_date}' "
    end

    scope_proc = search_scope(query_string, query_author)
    @results = scope_proc.call(EvidenceSource)
  end

  def sort_column
    return params[:sort] if params[:sort] == "name"

    EvidenceSource.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  #make query string for PG
  def make_query params
    query_string = String.new
    query_author = false
    #Geting Date

    items = params[:search][:search_fields_attributes].values
    items.each do |search_field|
      unless search_field[:content].blank?
        field = search_field[:field]
        query_string << "#{search_field[:op1]} " unless query_string.blank?
        query_string << "#{field} "
        query_string << "#{search_field[:op2]} "

        query_author = true if field == "name" or field == "name_abbr"

        if search_field[:op2] == "=" || search_field[:op2] == ">" || search_field[:op2] == "<"
          query_string << "'#{search_field[:content]}' "
        else
          query_string << "'%#{search_field[:content]}%' "
        end
      end
    end

    unless params[:search][:from_date].blank?
      query_string << "AND " unless query_string.blank?
      query_string << "published_time >= "
      query_string << "'#{params[:search][:from_date]}' "
    end

    unless params[:search][:to_date].blank?
      query_string << "AND " unless query_string.blank?
      query_string << "published_time <= "
      query_string << "'#{params[:search][:to_date]}' "
    end

    search_scope(query_string, query_author)
  end

  def search_scope(query_string, query_author=false)
    hash = {sort_column.to_sym => sort_direction.to_sym}
    if query_author
      -> (model) { model.joins(:evidence_source_authors).where(query_string).order(hash)}
    elsif sort_column == "name"
      -> (model) { model.joins(:evidence_source_authors).where(query_string).order("evidence_source_authors.#{sort_column} #{sort_direction}")}
    else
      -> (model) { model.where(query_string).order(hash)}
    end
  end
end
