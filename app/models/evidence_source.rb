class EvidenceSource < ApplicationRecord
    has_many :evidence_source_authors, dependent: :destroy

    def authors
      author_names = self.evidence_source_authors.collect { |e| e.name }

      return author_names.join(", ") if author_names
      ""
    end
end
