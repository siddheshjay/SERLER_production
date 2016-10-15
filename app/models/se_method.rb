class SeMethod < ApplicationRecord
  belongs_to :methodology
  has_and_belongs_to_many :g2_evidence_items, join_table: :g2_evidence_item_method
end
