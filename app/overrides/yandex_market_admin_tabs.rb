Deface::Override.new(
  virtual_path: 'spree/admin/shared/sub_menu/_configuration',
  name: "add-yandex-market-admin-tab",
  insert_bottom: '[data-hook="admin_configurations_sidebar_menu"]',
  text: '<%= configurations_sidebar_menu_item(Spree.t(:yandex_market), spree.admin_yandex_market_settings_path) %>',
  disabled: false
)
