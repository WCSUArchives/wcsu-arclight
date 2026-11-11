module Arclight
  # Render digital object links for a document
  class EmbedComponent < ViewComponent::Base
    def initialize(document:, presenter: nil, **kwargs)
      @document = document
      @presenter = presenter
      @blacklight_config = kwargs[:blacklight_config]
      super()
    end

    def render?
      resources.any?
    end

    def embeddable_resources
      resources.first(1).select { |object| embeddable?(object) }
    end

    def linked_resources
      resources - embeddable_resources
    end

    def resources
      @resources ||= begin
        return [] unless @document.respond_to?(:digital_objects)
        @document.digital_objects || []
      end
    end

    def depth
      return 0 unless @document.respond_to?(:parents)
      @document.parents&.length || 0
    end

    def embeddable?(object)
      exclude_patterns.none? { |pattern| object.href =~ pattern }
    end

    def exclude_patterns
      Arclight::Engine.config.oembed_resource_exclude_patterns
    end
  end
end	
