class AddExportFlagToTaxon < ActiveRecord::Migration[5.2]
  def self.up
    add_column :spree_taxons, :export_to_yandex_market, :boolean, :default => true,
               :null => false
  end

  def self.down
    remove_column :spree_taxons, :export_to_yandex_market
  end
end
