module Serenade
  # Implements Sprockets 3 and 4 API
  # Based on https://github.com/rtomayko/tilt/issues/292#issuecomment-236549078
  # see https://github.com/ai/autoprefixer-rails/pull/85/files#diff-511ef82f18d3627fd105a2c4680c5466
  class Processor
    def initialize(template_class)
      @template_class = template_class
    end

    def call(input)
      filename = input[:filename]
      source   = input[:data]
      context  = input[:environment].context_class.new(input)

      data = @template_class.new(filename) { source }.render(context, {})
      context.metadata.merge(data: data.to_str)
    end
  end
end
