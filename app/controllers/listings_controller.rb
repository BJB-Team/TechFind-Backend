class ListingsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  
  def index 
    @listings = Listing.all
    render json: @listings
  end 
  
  def create 
    
    @listing = current_user.listings.create(listing_params)

    if @listing.errors.any?
        render json: @listing.errors.full_messages, status: :unprocessable_entity
    else
        render json: @listing, status: 201
    end
  end 

  def show 

  end

  def update 

  end

  def destory 

  end   

  def listing_params
    params.require(:listing).permit(:title, :description, :price, :job_type_id, :job_level_id)
  end

end
