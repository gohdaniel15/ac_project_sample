class JobListingsController < ApplicationController

  before_action :authenticate_user!

  def index
    @job_listings = JobListing.all
    @job_listing = JobListing.new
  end

  def show
    @job_listing = job_listing
  end

  def new
    @job_listing = JobListing.new
  end

  def create
    @job_listings = JobListing.all
    @job_listing = current_user.job_listings.build(job_listing_params)

    if @job_listing.save
      @job_listing = JobListing.new
    end
  end

  def edit
    @job_listing = job_listing
  end

  def update
    @job_listing = job_listing
    if @job_listing.update(job_listing_params)
      redirect_to job_listings_path
    else
      render :edit, flash: { error: 'Failed to update job listing' }
    end
  end

  def destroy
    @job_listings = JobListing.all
    @job_listing = job_listing
    @job_listing.destroy

    respond_to do |format|
      format.html { redirect_to job_listings_path }
      format.js
    end
  end

  private

  def job_listing
    JobListing.find(params[:id])
  end

  def job_listing_params
    params.require(:job_listing).permit(:position, :salary, :description)
  end

end
