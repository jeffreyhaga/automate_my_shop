class ApplicationController < ActionController::Base
  protected

  def after_magic_link_sent_path_for(resource_or_scope)
    "/flows"
  end
end
