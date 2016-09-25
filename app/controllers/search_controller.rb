class SearchController < ApplicationController

  def search
    @search = Search.new
    @search.search_fields.build
  end

  def show
    @search = Search.new(search_params)

    if(@search.search_fields.blank?)
      @search.search_fields.build
    end
    query_string = make_query params

    puts query_string

    @papers = Paper.where(query_string)

  end

  private

  def search_params
    params.require(:search).permit(:from_date,:to_date,:name, :saved_on,
                                   :search_fields_attributes => [:content,:field,:op1,:op2,:_destroy]);
  end

  #make query string for PG
  def make_query params
    query_string = String.new
    #Geting Date

    items = params[:search][:search_fields_attributes].values
    items.each do |search_field|
      unless search_field[:content].blank?
        query_string << "#{search_field[:op1]} " unless query_string.blank?
        query_string << "#{search_field[:field]} "
        query_string << "#{search_field[:op2]} "

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

    query_string
  end
end