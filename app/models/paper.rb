class Paper < ApplicationRecord
  has_many :evidence_items
  belongs_to :user
  has_and_belongs_to_many :participants
  has_and_belongs_to_many :research_methods

  # Implement Search Papers
  scope :search, lambda {|fields,search_text|
    where(["#{field} LIKE ?","%#{search_text}%"])
  }
end
