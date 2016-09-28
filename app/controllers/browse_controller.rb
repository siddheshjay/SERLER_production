class BrowseController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @evidence_sources = EvidenceSource.order(created_at: :desc).page(params[:page])
  end
end
