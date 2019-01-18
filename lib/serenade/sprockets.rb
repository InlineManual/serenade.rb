require "serenade/template"
require "serenade/processor"
require "sprockets"

# Sprockets 2
# Sprockets.register_engine(".serenade", Serenade::Template)

# Sprockets 2, 3, 4
# See https://github.com/rails/sprockets/blob/master/guides/extending_sprockets.md#registering-all-versions-of-sprockets-in-processors
if Sprockets.respond_to?(:register_preprocessor)
  Sprockets.register_mime_type "text/x-serenade", extensions: [".serenade"], charset: :unicode
  Sprockets.register_preprocessor "text/x-serenade", Serenade::Template
elsif Sprockets.respond_to?(:register_engine)
  args = [".serenade", Serenade::Template]
  args << { silence_deprecation: true } if Sprockets::VERSION.start_with?("3")
  Sprockets.register_engine(*args)
end
