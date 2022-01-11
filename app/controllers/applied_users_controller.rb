class AppliedUsersController < ApplicationController
  before_action :authenticate_user, only: [:index]
  def apply
    puts "test"
    puts params
    @application = Application.new
    @application.applied_user = current_user.id
    @application.listing_user_id = params[:user_id]
    @application.listing_id = params[:id]
    @application.save
    if @application.errors.any?
      render json: @application.errors.full_messages, status: :unprocessable_entity
    else
      render json: @application, status: 201
    end
  end
  

  def index 
    my_listings = []
    my_applications = []

    @applications = Application.all
    @listing =  Listing.all
    @listing.each do |n|
      @applications.each do |a|
        if n.user_id == current_user.id and a.listing_id == n.id
          my_listings << n
          my_applications << Seeker.find_by_user_id(a.applied_user)
        end
      end
    end

    render json: {my_listings: my_listings, my_applications: my_applications}
  end
  
  def applied
    my_listings = []
    @listing =  Listing.all
    @applications = Application.all
    
    @listing.each do |n|
      @applications.each do |a|
        if a.applied_user == current_user.id and a.listing_id == n.id
          puts n 
          my_listings << n
        end
      end
    end
    render json: my_listings
  end

  
end
