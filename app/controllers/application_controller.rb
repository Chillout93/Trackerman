class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  require 'themoviedb'
  before_filter :set_config
  Tmdb::Api.key("624db803deeb9f8d71bb99dfdbfbd026")
  
  def set_config
    @configuration = Tmdb::Configuration.new
  end
end
