class ParksController < ApplicationController

  def index
    @park = Park.all
  end

  def show
    @park = Park.find(params[:id])
  end

  def new
    @park = Park.new
  end

  def edit
    @park = Park.find(params[:id])
  end

  def create
    @park = Park.new(park_params)
    auth = {
      cloud_name: "dqtp5a7ly",
      api_key:    "471412287734374",
      api_secret: "_3RG8bLwcuU_qLmO-UlGft3ToU0"
    }
    @park.picture = Cloudinary::Uploader.upload(params[:park][:picture].path, auth)["public_id"]
    if @park.save
      redirect_to @park
    else
      render "new"
    end
  end

  def update
    @park = Park.find(params[:id])

    if @park.update(park_params)
      redirect_to @park
    else
      render 'edit'
    end
  end

  def destroy
    @park = Park.find(params[:id])
    @park.destroy
    # Cloudinary::Uploader.destroy(public_id, :invalidate => true)
    # cannot destroy for now

    redirect_to parks_path
  end

  private
  def park_params
    params.require(:park).permit(:name, :description, :picture)
  end
end
