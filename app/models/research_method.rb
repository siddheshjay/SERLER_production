class ResearchMethod < ApplicationRecord
  has_and_belongs_to_many :papers
end
