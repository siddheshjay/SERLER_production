class Search < ApplicationRecord
  #attr_accessor :name, :date
  attr_accessor :from_date,:to_date
  has_many :search_fields,:dependent=> :destroy
  accepts_nested_attributes_for :search_fields, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
