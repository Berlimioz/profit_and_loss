require_dependency "profit_and_loss/application_controller"

module ProfitAndLoss
  class CommentsController < ApplicationController
    def create
      @cost_entry = CostEntry.find(params[:cost_entry_id])
      @comment = @cost_entry.comments.create(comment_params)
      flash[:notice] = "Comment has been created!"
      redirect_to cost_entries_path
    end

    private
    def comment_params
      params.require(:comment).permit(:text)
    end

  end
end
