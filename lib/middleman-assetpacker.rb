require "middleman-core"

Middleman::Extensions.register :assetpacker do
  require "middleman-assetpacker/extension"
  Middleman::Extension::Assetpacker
end
