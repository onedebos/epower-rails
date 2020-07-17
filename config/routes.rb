Rails.application.routes.draw do
  resources :users
  get '/user/credituser/:id', :to => 'users#credit_user', as: 'credit_user'
  get '/user/debituser/:id', :to => 'users#debit_user', as: 'debit_user'
  put '/user/withdraw/:id', :to => 'users#withdraw'
  put '/user/deposit/:id', :to => 'users#deposit'
  get '/user/findname', :to=> 'users#find_user_by_name'
  get 'users/user/balanceabove', :to=> 'users#users_with_balance_above_amt'
end
