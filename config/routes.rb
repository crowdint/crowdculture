CrowdCulture::Application.routes.draw do
  get "static_pages/home"
  root to: 'static_pages#home'
  get "static_pages/show_entries"
end
