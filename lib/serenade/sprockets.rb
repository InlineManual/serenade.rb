require "serenade/template"
require "sprockets"

Sprockets.register_mime_type "application/javascript+serenade", extensions: ['.serenade']
Sprockets.register_preprocessor("application/javascript+serenade", Serenade::Template)
