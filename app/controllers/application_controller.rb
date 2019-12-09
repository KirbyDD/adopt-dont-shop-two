class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :favorite_count

  def favorite_count
     if session[:favorites]
       @count ||= session[:favorites].keys.count
     else
       0
     end
  end
end
