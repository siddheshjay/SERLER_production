class SearchController < ApplicationController
  before_action :set_search, only: [:search]
  skip_before_action :authenticate_user!
  def search
  end

  private
  def search_params
    if params.include?(:search)
      params.require(:search).permit(:from_date,:to_date,:name, :saved_on,
                                     :search_fields_attributes => [:content,:field,:op1,:op2,:_destroy]);
    end
  end

  def set_search
    if search_params
      @search = Search.new(search_params)

      if(@search.search_fields.blank?)
        @search.search_fields.build
      end

      search_scope = make_query params
      @results = search_scope.call(EvidenceSource)
    else
      @search = Search.new
      @search.search_fields.build
      @results = []
    end
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
      query_string << "release_date >= "
      query_string << "'#{params[:search][:from_date]}' "
    end

    unless params[:search][:to_date].blank?
      query_string << "AND " unless query_string.blank?
      query_string << "release_date <= "
      query_string << "'#{params[:search][:to_date]}' "
    end

    search_scope(query_string, query_author)
  end

  def search_scope(query_string, query_author=false)
    if query_author
      -> (model) { model.joins(:evidence_source_authors).where(query_string)}
    else
      -> (model) { model.where(query_string) }
    end
  end
end
