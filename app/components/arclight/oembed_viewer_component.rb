# frozen_string_literal: true

module Arclight
  # Override to use direct IIIF viewer instead of oEmbed
  class OembedViewerComponent < ViewComponent::Base
    # Support both single resource and collection rendering
    def initialize(resource: nil, document: nil, oembed_viewer: nil)
      @resource = resource || oembed_viewer
      @document = document
    end

    def render?
      @resource&.href.present?
    end

    def iiif_manifest_url
      @resource.href
    end
  end
end
