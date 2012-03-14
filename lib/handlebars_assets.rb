require "handlebars_assets/version"

module HandlebarsAssets
  attr_accessor :js_path

  def self.path
    @js_path || File.expand_path("../../vendor/assets/javascripts", __FILE__)
  end

  def self.path=(path)
    @js_path = path
  end

  autoload(:Handlebars, 'handlebars_assets/handlebars')
  autoload(:TiltHandlebars, 'handlebars_assets/tilt_handlebars')

  if defined?(Rails)
    require 'handlebars_assets/engine'
  else
    require 'sprockets'
    Sprockets.register_engine '.hbs', TiltHandlebars
  end
end
