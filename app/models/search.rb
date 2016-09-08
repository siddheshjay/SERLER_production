class Search < ApplicationRecord
  attr_accessor :name
  has_many :search_fields, :dependent=> :destroy
  accepts_nested_attributes_for :search_fields, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
