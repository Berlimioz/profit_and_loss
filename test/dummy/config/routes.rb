Rails.application.routes.draw do

  resources :orders
  mount ProfitAndLoss::Engine => "/profit_and_loss"

  root to: 'profit_and_loss/cost_entries#index'

end
