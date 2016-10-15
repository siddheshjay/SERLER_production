require 'rails_helper'

RSpec.describe G2EvidenceItemsController, type: :controller do
  describe "DELETE #destroy" do
    it "can delete g2-evidence-item" do
      sign_in "analyst@example.com", :analyst

      user_id = User.limit(1)[0].id

      es = EvidenceSource.new
      es.title = "es title"
      es.status = "ACCEPTED"
      es.submitter_id = user_id
      es.save!

      esid = EvidenceSource.limit(1)[0].id

      ei = G2EvidenceItem.new({
      	evidence_source_id: esid,
      	creator: user_id,
      	status: 'DRAFT',
      	})

      ei.save!

      eiid = G2EvidenceItem.limit(1)[0].id

      delete :destroy, evidence_source_id: esid, id: eiid

      expect(response).to have_http_status(204) 

    end
  end
end
