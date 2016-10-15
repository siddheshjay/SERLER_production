class G2EvidenceItem < ApplicationRecord
    has_and_belongs_to_many :se_methods, join_table: :g2_evidence_item_method
end
