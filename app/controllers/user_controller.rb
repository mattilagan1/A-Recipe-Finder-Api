class UserController < ApplicationController
  def index
    users = User.all

    render json: users
  end

  def show
    render json: user
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if user.save
      render json: { message: 'User was successfully Created' }, status: :created
    else
      render json: { errors: user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    user.update(
      name: params[:name] || user.name,
      email: params[:email] || user.email,
      password: params[:password] || user.password,
      password_confirmation: params[:password_confirmation] || user.password_confirmation
    )

    render json: user
  end

  def destroy
    user.destroy

    render json: { message: 'User deleted...' }
  end

  
end
