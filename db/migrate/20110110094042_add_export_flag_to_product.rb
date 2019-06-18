class AddExportFlagToProduct < ActiveRecord::Migration[5.2]
  def self.up
    add_column :spree_products, :export_to_yandex_market, :boolean, :default=>true, :null=>false
  end

  def self.down
    remove_column :spree_products, :export_to_yandex_market
  end
end
