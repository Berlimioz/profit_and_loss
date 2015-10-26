require_dependency "profit_and_loss/application_controller"

module ProfitAndLoss
  class ProfitEntriesController < ApplicationController
    before_action :set_profit_entry, only: [:show, :edit, :update, :destroy]

    # GET /profit_entries
    def index
      @profit_entries = ProfitEntry.all
    end

    # GET /profit_entries/1
    def show
    end

    # GET /profit_entries/new
    def new
      @profit_entry = ProfitEntry.new
    end

    # GET /profit_entries/1/edit
    def edit
    end

    # POST /profit_entries
    def create
      @profit_entry = ProfitEntry.new(profit_entry_params)

      if @profit_entry.save
        redirect_to @profit_entry, notice: 'Profit entry was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /profit_entries/1
    def update
      if @profit_entry.update(profit_entry_params)
        redirect_to @profit_entry, notice: 'Profit entry was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /profit_entries/1
    def destroy
      @profit_entry.destroy
      redirect_to profit_entries_url, notice: 'Profit entry was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_profit_entry
        @profit_entry = ProfitEntry.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def profit_entry_params
        params.require(:profit_entry).permit(:name, :ttc_price_in_cents, :information)
      end
  end
end
