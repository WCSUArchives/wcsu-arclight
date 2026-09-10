# Pin npm packages by running ./bin/importmap

pin "application"

pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

# Bootstrap & Popper (required by Blacklight 8)
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.3.3/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.8/lib/index.js"

# Blacklight & ArcLight JS
pin "blacklight", to: "blacklight/blacklight.js"
pin "arclight", to: "arclight/arclight.js"
pin "arclight/oembed_controller", to: "arclight/oembed_controller.js"
pin "arclight/truncate_controller", to: "arclight/truncate_controller.js"
