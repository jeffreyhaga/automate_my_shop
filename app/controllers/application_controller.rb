class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(resource)
    flows_path # This will redirect to the flows index page
  end
end
