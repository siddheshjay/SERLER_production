class SeMethod < ApplicationRecord
  belongs_to :methodology
  has_and_belongs_to_many :evidence_items
end
