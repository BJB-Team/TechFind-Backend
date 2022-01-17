class UsersController < ApplicationController
  
  def create
      @user = User.create(user_params)
      puts @user
      if @user.save
          auth_token = Knock::AuthToken.new payload: {sub: @user.id}
          render json: {username: @user.username, jwt: auth_token.token, id: @user.id}, status: 201
      else
          render json: {test: @user.errors}
      end
  
  end

  def sign_in
      @user = User.find_by_email(params[:email])
      if @user && @user.authenticate(params[:password])
          auth_token = Knock::AuthToken.new payload: {sub: @user.id}
          render json: {username: @user.username, jwt: auth_token.token, id: @user.id, account_seeker: @user.account_seeker}, status: 201
      else
          render json: {error: "username or password incorrect"}
      end
  end

  def show
    @current_user = User.find_by_username(current_user.username)
    if @current_user.account_seeker == "true"
      @seeker_attributes = Seeker.find_by_user_id(current_user.id)
      render json:  {user: @current_user, seeker_attributes: @seeker_attributes}
    else
      @company_attributes = Company.find_by_user_id(current_user.id)
      render json:  {user: @current_user, company_attributes: @company_attributes}
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.authenticate(params[:user][:password])
      
      @user.update(user_params)
      if @user.errors.any?
        render json: @user.errors
      else
        render json: @user, status: 201
      end
    else
      render json: "error", status: 400
    end
  end

  def destroy
     @user = User.find_by_id(params[:id])
     if @user.account_seeker == "true"
      @seeker = Seeker.find_by_user_id(params[:id])
      @seeker.destroy
     else
      @company = Company.find_by_user_id(params[:id])
      @company.destroy
     end
      @user.destroy
     render json: {user: "Message deleted"}, status: 204
  end

  def user_params
    
    if (params[:user][:account_seeker] == "true")
      params.require(:user).permit(:username, :email, :password, :account_seeker, :password_confirmation, seeker_attributes: [:first_name, :last_name, :phone, :resume])
    else
      
      params.require(:user).permit(:username, :email, :password, :account_seeker, :password_confirmation, company_attributes: [:company_name, :website, :phone, :description])
    end
  end
end
