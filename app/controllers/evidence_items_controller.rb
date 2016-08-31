class EvidenceItemsController < ApplicationController
  before_action :set_evidence_item, only: [:show, :edit, :update, :destroy]

  # GET /evidence_items
  # GET /evidence_items.json
  def index
    @evidence_items = EvidenceItem.all
  end

  # GET /evidence_items/1
  # GET /evidence_items/1.json
  def show
  end

  # GET /evidence_items/new
  def new
    @evidence_item = EvidenceItem.new
  end

  # GET /evidence_items/1/edit
  def edit
  end

  # POST /evidence_items
  # POST /evidence_items.json
  def create
    @evidence_item = EvidenceItem.new(evidence_item_params)

    respond_to do |format|
      if @evidence_item.save
        format.html { redirect_to @evidence_item, notice: 'Evidence item was successfully created.' }
        format.json { render :show, status: :created, location: @evidence_item }
      else
        format.html { render :new }
        format.json { render json: @evidence_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evidence_items/1
  # PATCH/PUT /evidence_items/1.json
  def update
    respond_to do |format|
      if @evidence_item.update(evidence_item_params)
        format.html { redirect_to @evidence_item, notice: 'Evidence item was successfully updated.' }
        format.json { render :show, status: :ok, location: @evidence_item }
      else
        format.html { render :edit }
        format.json { render json: @evidence_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evidence_items/1
  # DELETE /evidence_items/1.json
  def destroy
    @evidence_item.destroy
    respond_to do |format|
      format.html { redirect_to evidence_items_url, notice: 'Evidence item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evidence_item
      @evidence_item = EvidenceItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evidence_item_params
      params.require(:evidence_item).permit(:evidence_id, :benefit_comeout, :context, :confidence_rate, :integrity)
    end
end
