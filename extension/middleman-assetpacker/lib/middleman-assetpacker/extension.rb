require 'middleman-core'

class Middleman::Extension::Assetpacker < ::Middleman::Extension
  option :manifest_path, nil, 'manifest json location'

  def initialize(app, options_hash={}, &block)
    super

    require "json"
  end

  helpers do
    def javascript_pack_tag(name, *options)
      path = compute_source_path(name, :js)
      javascript_include_tag(path, *options)
    end

    def stylesheet_pack_tag(name, *options)
      path = compute_source_path(name, :css)
      stylesheet_link_tag(path, *options)
    end

    def image_pack_tag(name, *options)
      path = compute_source_path(File.join("images", name), :images)
      image_tag(path, *options)
    end

    def compute_source_path(name, kind=nil)
      normalized_name = kind ? asset_normalize_extension(kind, name.dup) : name
      asset_manifest.fetch(normalized_name)
    end

    def asset_manifest
      path = app.extensions[:assetpacker].options.manifest_path
      JSON.parse(File.read(path))
    end
  end
end
