class EvidenceItem < ApplicationRecord
  belongs_to :paper
  has_and_belongs_to_many :se_methods
end
