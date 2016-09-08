class SearchController < ApplicationController

  def search
    @search = Search.new
    @search.search_fields.build
  end

  def show
    query_string = make_query params

    @papers = Paper.where(query_string)

  end


  private
  def make_query params
    query_string = String.new
    items = params[:search][:search_fields_attributes].values
    items.each do |search_field|
      unless search_field[:content].blank?
        query_string << "#{search_field[:operator]} " unless query_string.blank?
        query_string << "#{search_field[:limiter]} ILIKE "
        query_string << "'%#{search_field[:content]}%' "
      end
    end
    puts "quering = #{query_string}"
    query_string
  end
end
