require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
ENV["RAILS_ADMIN_THEME"] = "rollincode"

module Blog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif *.svg)
    config.assets.paths += Dir["#{Rails.root}/vendor/assets/*"]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.i18n.default_locale = :"pt-BR"
    config.i18n.available_locales = :"pt-BR"
  end
end
