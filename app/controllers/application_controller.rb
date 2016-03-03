class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_photographer!, except: [:search, :show, :index]

  def run(klass, *args, &block)
    klass.new(repo, &block).run(*args)
  end

  def repo
    @repo = PhotographerRepository.new
  end
  helper_method :repo
end
