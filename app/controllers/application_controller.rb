class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    current_user.admin? ? admin_main_index_path : search_path
  end
end
