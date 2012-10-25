CrowdCulture::Application.routes.draw do
  get "static_pages/home"
  root to: 'static_pages#home'
  get "static_pages/update"
  match "update", to: 'static_pages#update'
end
