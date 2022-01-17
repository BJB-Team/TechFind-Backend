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
    @user = User.find_by_id(@listing.user_id)
    @company = Company.find_by_user_id(@user.id)
    puts "here"
    puts @company
    render json: {company: @company, listing: @listing}

  end

  def update 
    @listing.update(listing_params)
    render json: @listing, status: 204
  end

  def destroy 
    @listing.destroy
    render json: {listing: "listing deleted"}, status: 204
  end   

  def applications

  end

  private 

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :price, :job_type_id, :job_level_id)
  end

end