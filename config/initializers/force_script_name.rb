Rails.application.config.to_prepare do
  ApplicationController.class_eval do
    before_action do
      request.env["SCRIPT_NAME"] = "/caoSearch"
    end
  end
end
