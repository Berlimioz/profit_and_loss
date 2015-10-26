module ProfitAndLoss
  module ApplicationHelper
    def display_date(date)
      date.in_time_zone("Paris").strftime('%d/%m/%Y')
    end
  end
end
