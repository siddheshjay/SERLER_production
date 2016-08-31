class Paper < ApplicationRecord
  has_many :evidence_items
  belongs_to :user
  has_and_belongs_to_many :participants
  has_and_belongs_to_many :research_methods
end
