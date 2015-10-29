require_dependency "profit_and_loss/application_controller"

module ProfitAndLoss
  class CostAndProfitEntriesController < ApplicationController
    before_action :set_cost_entry, only: [:show, :edit, :update, :destroy]

    # GET /cost_entries
    def index
      @cost_entries = CostEntry.all
      @profit_entries = ProfitEntry.all
      @reports = Report.all
    end

  end
end
