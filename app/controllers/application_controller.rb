class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user! #未ログイン時はログインページに遷移する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters #追加したキーのパラメーターを許可する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
