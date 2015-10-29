ProfitAndLoss::Engine.routes.draw do
  resources :cost_and_profit_entries, only: [:index]
  resources :profit_entries
  resources :cost_entries do
    resources :comments
  end


  resources :reports, except: [:update, :edit]

  root to: "cost_and_profit_entries#index"
end
