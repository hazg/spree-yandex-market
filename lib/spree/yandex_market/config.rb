module Spree
  module YandexMarket
    #
    # Usage:
    #   Spree::YandexMarket::Config[:foo]                  # Returns the foo preference
    #   Spree::YandexMarket::Config[]                      # Returns a Hash with all the google base preferences
    #   Spree::YandexMarket::Config.instance               # Returns the configuration object (YandexMarketConfiguration.new)
    #   Spree::YandexMarket::Config.set(preferences_hash)  # Set the advanced cart preferences as especified in +preference_hash+
    class Config
      include Singleton

      class << self
        def instance
          Spree::YandexMarketConfiguration.new
        end
      end
    end
  end
end

