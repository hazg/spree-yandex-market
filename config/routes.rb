Spree::Core::Engine.add_routes do
  namespace :admin do
    resource :yandex_market_settings do
      member do
        match :general, via: [:get, :put]
        get :currency
        get :export_files
        get :ware_property
        get :run_export
      end
    end
  end
end
