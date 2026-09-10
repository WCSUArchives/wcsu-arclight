Rails.application.config.after_initialize do
  Rails.application.routes.default_url_options[:script_name] ||= "/caoSearch"
end
