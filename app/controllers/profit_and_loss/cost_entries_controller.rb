require_dependency "profit_and_loss/application_controller"

module ProfitAndLoss
  class CostEntriesController < ApplicationController
    before_action :set_cost_entry, only: [:show, :edit, :update, :destroy]

    # GET /cost_entries
    def index
      @cost_entries = CostEntry.all
    end

    # GET /cost_entries/1
    def show
    end

    # GET /cost_entries/new
    def new
      @cost_entry = CostEntry.new
    end

    # GET /cost_entries/1/edit
    def edit
    end

    # POST /cost_entries
    def create
      @cost_entry = CostEntry.new(cost_entry_params)

      if @cost_entry.save
        redirect_to @cost_entry, notice: 'Cost entry was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /cost_entries/1
    def update
      if @cost_entry.update(cost_entry_params)
        redirect_to @cost_entry, notice: 'Cost entry was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /cost_entries/1
    def destroy
      @cost_entry.destroy
      redirect_to cost_entries_url, notice: 'Cost entry was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_cost_entry
        @cost_entry = CostEntry.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def cost_entry_params
        params.require(:cost_entry).permit(:name, :information, :ttc_price)
      end
  end
end
