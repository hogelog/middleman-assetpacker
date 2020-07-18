require_relative "./lib/asset_manifest_helper"

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

helpers do
  include AssetManifestHelper
end