require "sidekiq"
require "sidekiq/web"


Rails.application.routes.draw do
  namespace "api" do
    resources :diaries
    resources :notes
  end
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == "admin" && password == "admin"
  end
  mount Sidekiq::Web => "/sidekiq"
end
