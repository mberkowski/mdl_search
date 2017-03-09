require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MdlSearch
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.autoload_paths << Rails.root.join('lib')
    config.assets.paths << Rails.root.join('vendor', 'assets', 'components')

    # /via https://medium.com/technically-speaking/rails-react-browserify-e315001d5974#.nnnog8fnc
    config.browserify_rails.commandline_options = "-t [ babelify --presets [ react es2015 stage-0] ] --extension=\".js.jsx\" "

    unless Rails.env.production?
        # Work around sprockets+teaspoon mismatch:
        Rails.application.config.assets.precompile += %w(spec_helper.js)

        # # Make sure Browserify is triggered when
        # # asked to serve javascript spec files
        # config.browserify_rails.paths << lambda { |p|
        #   p.start_with?(Rails.root.join("spec/javascripts").to_s)
        # }

        config.browserify_rails.paths << lambda { |p|
           p.start_with?(Rails.root.join("spec/javascripts/components").to_s)
        }
    end

    # https://github.com/rails/actionpack-page_caching
    config.action_controller.page_cache_directory = "#{Rails.root}/public/cached_pages"
  end
end
