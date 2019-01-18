require "serenade/template"
require "sprockets"

# Sprockets 4
# See https://github.com/rails/sprockets/blob/master/guides/extending_sprockets.md#registering-all-versions-of-sprockets-in-processors
if Sprockets.respond_to?(:register_transformer)
  Sprockets.register_mime_type "text/x-serenade", extensions: [".serenade"], charset: :javascript
  Sprockets.register_preprocessor "text/x-serenade", Serenade::Template
end

# Sprockets 2, 3
# See https://github.com/rails/sprockets/blob/master/guides/extending_sprockets.md#registering-all-versions-of-sprockets-in-processors
if Sprockets.respond_to?(:register_engine)
  args = [".serenade", Serenade::Template]
  args << { mime_type: "text/x-serenade", silence_deprecation: true } if Sprockets::VERSION.start_with?("3")
  Sprockets.register_engine(*args)
end
