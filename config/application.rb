require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module EcommerceTest
  class Application < Rails::Application
    config.time_zone = 'Asia/Singapore'

    config.active_record.raise_in_transactional_callbacks = true
  end
end
