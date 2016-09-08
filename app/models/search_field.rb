class SearchField < ApplicationRecord
  attr_accessor :search_id, :content, :limiter, :operator
  belongs_to :search

end
