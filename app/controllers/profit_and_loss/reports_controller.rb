require_dependency "profit_and_loss/application_controller"

module ProfitAndLoss
  class ReportsController < ApplicationController
    before_action :set_report, only: [:show, :destroy]

    # GET /reports
    def index
      @reports = Report.all
    end

    def show
      @profit_objects = ProfitAndLoss.profit_class.constantize.where.not(ProfitAndLoss.profit_ttc_price_in_cents_method => nil).where("#{ProfitAndLoss.profit_date_method} >= ? AND #{ProfitAndLoss.profit_date_method} < ?", @report.from_date, @report.to_date)
      @profit_objects_total = @profit_objects.where.not(ProfitAndLoss.profit_ttc_price_in_cents_column => nil).pluck(ProfitAndLoss.profit_ttc_price_in_cents_column).sum / 100.0
      @profit_total = @profit_objects_total + @report.profit_entries.where.not(ttc_price_in_cents: nil).pluck(:ttc_price_in_cents).sum / 100.0
      @loss_total = @report.loss_entries.where.not(ttc_price_in_cents: nil).pluck(:ttc_price_in_cents).sum / 100.0
      @total_result = @profit_total - @loss_total
    end

    def new
      @report = Report.new
      @report.init_profit_loss_entries
    end

    def create
      @report = Report.new(report_params)
      if @report.save
        redirect_to @report, notice: "Le rapport a bien été généré."
      else
        render :new
      end
    end

    def destroy
      @report.profit_loss_entries.destroy_all
      @report.destroy
      redirect_to reports_url, notice: "Le rapport a été supprimé."
    end

    private
    def report_params
      params.require(:report).permit(:name, :from_date, :to_date, profit_loss_entries_attributes: [:id, :name, :ttc_price_in_cents, :profit, :cost_entry_id, :profit_entry_id, :report_id])
    end

    def set_report
      @report = Report.find(params[:id])
    end
  end
end
