class EvidenceSource < ApplicationRecord
    has_many :evidence_source_authors, dependent: :destroy
end
