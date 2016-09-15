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
    @papers = Paper.where(query_string)
  end



  private

  def search_params
    params.require(:search).permit(:name, :saved_on,
                                   :search_fields_attributes => [:content,:field,:op1,:op2,:_destroy]);
  end

  #make query string for PG
  def make_query params
    query_string = String.new
    items = params[:search][:search_fields_attributes].values
    items.each do |search_field|
      unless search_field[:content].blank?
        query_string << "#{search_field[:op1]} " unless query_string.blank?
        query_string << "#{search_field[:field]} "
        query_string << "#{search_field[:op2]} "
        query_string << "'%#{search_field[:content]}%' "
      end
    end
    query_string
  end
end