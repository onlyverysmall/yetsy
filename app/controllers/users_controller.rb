class UsersController < ApplicationController

  before_filter :redirect_logged_in_user, only: [:new]

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

  def edit
    @user = User.find(params[:id])

    render json: @user
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])

    if @user == current_user
      render :show
    else
      redirect_to root_url
    end
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])

    if @user.save
      render json: @user
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @user.errors.full_messages.to_sentence
      render :edit
    end
  end
end
