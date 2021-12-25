class JobTypesController < ApplicationController
  def index 
    @job_type = JobType.all
    render json: @job_type
  end 
end
