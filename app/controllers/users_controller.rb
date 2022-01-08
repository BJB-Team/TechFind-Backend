class UsersController < ApplicationController
  def create
      @user = User.create(user_params)
      if @user.save
          auth_token = Knock::AuthToken.new payload: {sub: @user.id}
          render json: {username: @user.username, jwt: auth_token.token}, status: 201
      else
          
          render json: @user.errors, status: :unprocessable_entity
      end
  
  end

  def sign_in
      @user = User.find_by_email(params[:email])
      puts @user
      if @user && @user.authenticate(params[:password])
          auth_token = Knock::AuthToken.new payload: {sub: @user.id}
          render json: {username: @user.username, jwt: auth_token.token, id: @user.id, account_seeker: @user.account_seeker}, status: 201
      else
          render json: {error: "username or password incorrect"}
      end
  end

  def show
    @current_user = User.find_by_username(current_user.username)
    render json: @current_user
  end

  def user_params

    if (params[:account_seeker])
      
      params.require(:user).permit(:username, :email, :password, :account_seeker, :password_confirmation, seeker_attributes: [:first_name, :last_name, :phone, :resume])
    else
     
      params.require(:user).permit(:username, :email, :password, :account_seeker, :password_confirmation, company_attributes: [:company_name, :website, :phone, :description])
    end
  end
end
