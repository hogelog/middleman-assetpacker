require "middleman-core"

Middleman::Extensions.register :middleman-assetpacker do
  require "my-extension/extension"
  MyExtension
end
