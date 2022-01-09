class AppliedUsersController < ApplicationController

  def apply
    
    @application = Application.new
    @application.applied_user = current_user.id
    @application.listing_id = params[:id]
    @application.save
    if @application.errors.any?
      render json: @application.errors.full_messages, status: :unprocessable_entity
    else
      render json: @application, status: 201
    end
  end
  
  
end
