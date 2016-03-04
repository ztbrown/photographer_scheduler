class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!, except: [:search, :show, :index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def run(klass, *args, &block)
    klass.new(repo, &block).run(*args)
  end

  def repo
    @repo = PhotographerRepository.new
  end
  helper_method :repo

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :role_id
  end
end
