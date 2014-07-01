Deface::Override.new( :virtual_path => "spree/admin/shared/_menu",
                      :name => "add-yandex-market-admin-tab",
                      :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                      :text => "<%= tab :yandex_market, :icon => 'shopping-cart', :url => spree.admin_yandex_market_settings_path, :match_path => '/yandex_market_settings' %>",
                      :disabled => false
                    )
