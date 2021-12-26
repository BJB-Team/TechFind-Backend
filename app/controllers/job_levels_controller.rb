class JobLevelsController < ApplicationController
  def index 
    @job_level = JobLevel.all
    render json: @job_level
  end 
end
