ProfitAndLoss::Engine.routes.draw do
  resources :profit_entries
  resources :cost_entries do
    resources :comments
  end

  resources :reports, except: [:update, :edit]

  root to: "cost_entries#index"
end
