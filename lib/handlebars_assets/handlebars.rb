# Based on https://github.com/josh/ruby-coffee-script
require 'execjs'
require 'pathname'

module HandlebarsAssets
  class Handlebars
    class << self
      def precompile(*args)
        context.call('Handlebars.precompile', *args)
      end

      def compile(html, data= {})
        context.call("Handlebars.compile(#{html.inspect})", data)
      end

      private

      def context
        @context ||= ExecJS.compile(source)
      end

      def source
        @source ||= path.read + helper_path.read
      end

      def path
        @path ||= assets_path.join('handlebars.js')
      end

      def helper_path
        @helper_path ||= assets_path.join('handlebars.helpers.js')
      end

      def assets_path
        @assets_path ||= Pathname(HandlebarsAssets.path)
      end
    end
  end
end
