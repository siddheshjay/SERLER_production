class G2EvidenceItemsController < ApplicationController
    def destroy
        puts "to delete a G2EvidenceItem"
        # @evience_source = EvidenceSource.find(params[:evidence_source_id])
        begin
            evidence_item = G2EvidenceItem.find(params[:id])
            evidence_item.delete
        # rescue
        #     puts ""
        end
    end
end
