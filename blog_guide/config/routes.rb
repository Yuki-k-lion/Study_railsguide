Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

# get '/patients/:id', to: 'patients#show', as: 'patient'
  resources :articles do
    resources :comments
  end


# コントローラを名前空間によってグループ化することもできます。
# 最もよく使用される名前空間といえば、
# 多数の管理用コントローラ群をまとめるAdmin::名前空間でしょう。
# これらのコントローラをapp/controllers/adminディレクトリに配置し、
# ルーティングでこれらをグループ化できます。
  # namespace :admin do
  #   resources :users
  # end
  # https://railsguides.jp/routing.html
end
