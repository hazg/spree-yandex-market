# -*- coding: utf-8 -*-
class Spree::Admin::YandexMarketSettingsController < Spree::Admin::BaseController  
  before_filter :get_config

  def show
    @taxons = Spree::Taxon.roots
  end

  def general
    @taxons = Spree::Taxon.roots
  end

  def currency
  end

  def ware_property
    @properties = Spree::Property.all
  end

  def export_files_for_dir(directory)
    # нельзя вызывать стат, не удостоверившись в наличии файла!!111
    Dir[directory].map { |x| [File.basename(x), (File.file?(x) ? File.mtime(x) : Time.new(0))] }
    .reject(&:blank?)
    .sort_by(&:last)
  end

  def export_files
    @export_files = export_files_for_dir File.join(Rails.root, 'public', 'yandex_market', '**', '*')
    @export_files_wikimart = export_files_for_dir File.join(Rails.root, 'public', 'wikimart', '**', '*')
  end

  def run_export
    command = case params[:exporter]
    when 'yandex_market'
      %{cd #{Rails.root} && RAILS_ENV=#{Rails.env} rake --trace spree_yandex_market:generate_ym &}
    when 'wikimart'
      %{cd #{Rails.root} && RAILS_ENV=#{Rails.env} rake --trace spree_yandex_market:generate_wikimart &}
    end

    logger.info "[ yandex market ] Запуск формирование файла экспорта из блока администрирования "
    logger.info "[ yandex market ] команда - #{command} "
    system command
    flash[:notice] = "Обновите страницу через несколько минут."
    redirect_to export_files_admin_yandex_market_settings_url
  end

  def update
    preferences_params.each do |name, value|
      @config.set_preference name, value
    end

    respond_to do |format|
      format.html {
        redirect_to admin_yandex_market_settings_path
      }
    end
  end

  private

  def get_config
    @config = Spree::YandexMarket::Config.instance
  end

  def preferences_params
    params.require(:preferences).permit(:currency, :short_name, :full_name, :url, :category, :wares, :local_delivery_cost)
  end
end
