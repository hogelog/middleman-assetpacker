require "pathname"
require "json"

module AssetManifestHelper
  def javascript_pack_tag(name, *options)
    path = compute_source_path(name, :js)
    javascript_include_tag(path, *options)
  end

  def stylesheet_pack_tag(name, *options)
    path = compute_source_path(name, :css)
    stylesheet_link_tag(path, *options)
  end

  def image_pack_tag(name, *options)
    path = compute_source_path(name, :images)
    javascript_include_tag(path, *options)
  end

  private

  def compute_source_path(name, kind=nil)
    names = [name]
    names.unshift(asset_normalize_extension(kind, name.dup)) if kind
    asset_name = names.find do |name|
      asset_manifest[name]
    end
    raise "#{name} not found" unless asset_name
    asset_manifest[asset_name]
  end

  def asset_manifest
    manifest_path = Pathname.new("source/packs/parcel-manifest.json")
    JSON.parse(manifest_path.read)
  end
end