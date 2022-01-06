class ListingsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  before_action :set_listing, only: [ :show, :update, :edit, :destroy ]
  
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
    render json: @listing
  end

  def update 

  end

  def destroy 
    @listing.delete
    render json: {listing: "listing deleted"}, status: 204
  end   

  private 

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :price, :job_type_id, :job_level_id)
  end

end
