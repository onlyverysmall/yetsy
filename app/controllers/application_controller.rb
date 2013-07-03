class ApplicationController < ActionController::Base
  protect_from_forgery

  include SessionsHelper
  include UsersHelper

  def redirect_logged_in_user
    if logged_in? 
      flash[:errors] ||= []
      flash[:errors] << "You are already logged in"
      redirect_to current_user 
    end
  end

  def redirect_shop_owner
    if current_user.shop 
      flash[:errors] ||= []
      flash[:errors] << "You already have a shop"
      redirect_to current_user 
    end
  end
end
