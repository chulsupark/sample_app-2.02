# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  #also in controllers
  include SessionsHelper
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'd3480c51c37ef691431610d26bbc6a77'
  
  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
end
