require "serenade"
require "tilt"

module Serenade
  # Tilt template for Serenade views. Tilt is used by Sprocket engines.
  class Template < Tilt::Template
    # @return [String] mime type assigned to all Serenade templates
    def self.default_mime_type
      "application/javascript"
    end

    # Tilt forces us to override this, or it will raise a NotImplementedError.
    def prepare
    end

    # Used by tilt to render the template.
    #
    # @param scope
    # @param [Hash] locals
    # @return (see Serenade::Renderer#render)
    def evaluate(scope, locals, &block)
      self.class.evaluate(scope, data)
    end

    # Sprockets 3 and 4 API
    # see https://github.com/ai/autoprefixer-rails/pull/85/files#diff-511ef82f18d3627fd105a2c4680c5466
    def self.call(input)
      filename  = input[:filename]
      source    = input[:data]
      evaluate(filename, source)
    end

    def self.evaluate(scope, source)
      name =
        if scope.respond_to?(:logical_path)
          # See Sprockets::Context#logical_path
          scope.logical_path.gsub(/^views\//, "")
        else
          scope.chomp(File.extname(scope)).gsub(/^views\//, "")
        end

      Serenade::Renderer.new(name, source.dup).render
    end
  end
end
