require 'builder'

Time.zone = 'UTC'

# === Company specific settings.
set :company, {
  :name => 'HealthDecision',
  :legal_name => 'HealthDecision Support, Inc',
  :twitter_handle =>  '@health_decision',

  :training_email => 'fahmad@healthdecision.com',

  :website => 'https://healthdecision.com',
  :about_url => 'https://healthdecision.com/about',
  :hipaa_policies_url => 'https://heart.healthdecision.com/hipaa/policies',

  :privacy_officer_name => 'Farhan Ahmad',
  :security_officer_name => 'Farhan Ahmad',

  # Random employee names for the quizes.
  :random_non_officer_employee_name_1 => 'Jon Keevil',
  :random_non_officer_employee_name_2 => 'Joe Harvey',
  :random_non_officer_employee_name_3 => 'Aaron Greenblatt',

  # Google URL
  :completion_google_form_url => 'https://docs.google.com/forms/d/e/1FAIpQLSeCA0r-98fJNgf8BYz-zISi6pgqTSxkDPidwyVyA7hU9lcYbA/viewform?usp=sf_link'
}
set :url_root, 'https://heart.healthdecision.com/hipaa/training'

# === End company specific settings.

set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/img'

activate :directory_indexes

# Empty string makes the browser default to whatever protocol is being used (http/https).
set :cdn_root_protocol, ''

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :directory_indexes

  if ENV["BUILD_FOR_FILESYSTEM"] == "true"
    # For builds that we will be opened from the file system (file:// protocol) we have to
    # for http for included CDN resources.
    set :cdn_root_protocol, "http:"
    activate :asset_host, :host => "./"
  end
end

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true, :tables => true, :with_toc_data => true, :no_intra_emphasis => true

activate :syntax, :wrap => true

activate :search_engine_sitemap

page '/sitemap.xml', :layout => false

helpers do
  def some_helper
    "Helping"
  end
end