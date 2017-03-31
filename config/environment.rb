# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Set the paperclip location
Paperclip.options[:command_path] = "/usr/local/lib/ruby/gems/2.3.0/gems/paperclip-5.0.0/"
