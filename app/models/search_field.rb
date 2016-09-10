class SearchField < ApplicationRecord
  attr_accessor :search_id, :content, :field, :op1, :op2
  belongs_to :search

end
