CrowdCulture::Application.routes.draw do
  get "static_pages/home"
  root to: 'static_pages#home'
  get "static_pages/feed"
  match '/feed', to: 'static_pages#feed'
end
