class AppliedUsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :destroy]

  def apply
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
          puts Seeker.find_by_user_id(a.applied_user)
          my_listings << n
          my_applications << Seeker.find_by_user_id(a.applied_user)
          puts Seeker.find_by_user_id(a.applied_user)
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


  def download
    s = Seeker.find_by_id(params[:id])
    bucket_name = 'techfind-dev'
    object_key = s.resume.key.to_s
    region = 'ap-southeast-2'
    
    s3_client = Aws::S3::Client.new(region: region)

    @download = Aws::S3::Object.new(
        key: object_key, bucket_name: bucket_name, client: s3_client).presigned_url(:get, expires_in: 60 * 60
    )
    render json: @download
  end

  def destroy
    
    @applications = Application.all
    @applications.each do |a|
      if a.applied_user == current_user.id and a.listing_id.to_s == (params[:id].to_s)
        a.destroy
      end 
    end
    
    render json: {application: "application deleted"}, status: 204
  end

end
