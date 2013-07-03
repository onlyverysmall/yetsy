class UsersController < ApplicationController
  before_filter :redirect_logged_in_user, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      login_user(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @user = User.find(params[:id])

    if user_authorized?(@user)
      render :show
    else
      redirect_to root_url
    end
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])

    if user_authorized?(@user) && @user.save
      # should render a success message also
      render :show
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @user.errors.full_messages.to_sentence
      render :show
    end
  end
end
