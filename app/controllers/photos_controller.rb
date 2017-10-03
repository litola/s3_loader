class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
      @photo = Photo.new
  end
   
  def create
      @photo = Photo.new(photo_params)
      if @photo.save
          flash[:success] = 'Photo added!'
          redirect_to photos_path
      else
          render 'new'
      end
  end
  
  def edit
    @photo = Photo.find(params[:id])
  end
   
  def update
      @photo = Photo.find(params[:id])
      if @photo.update_attributes(photo_params)
        flash[:success] = 'Photo edited!'
        redirect_to photos_path
      else
        render 'edit'
      end
  end
  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      flash[:success] = 'Photo deleted!'
      redirect_to photos_path
    else
      flash[:success] = 'Oops something went wrong try again!'
      redirect_to photos_path
    end
  end


  private
   
  def photo_params
      params.require(:photo).permit(:title, :image, :remove_image)
  end
end