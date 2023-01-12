class UsersController < ApplicationController
  def profile
  end
  def upload_profile
    if params[:image].present?
      @user = User.find(1)
      if @user.images.present? & @user.profile_pic_available?
        @image = @user.profile_pic
        @image.image_url =  params[:image]    
      else
        @image = Image.new(
          imageable_id: 1,
          imageable_type: "User",
          image_url: params[:image],
          image_type: "profile"
        )
      end
      respond_to do |format|
        if @image.save
          @success = true
          format.js { }
        else
          format.js {}
        end          
      end
    end
  end


  def upload_cover
    if params[:image].present?
      @user = User.find(1) 
      if @user.images.present? && @user.cover_pic_available?
        @image = @user.cover_pic
        @image.image_url =  params[:image]    
      else
        @image = Image.new(
          imageable_id: 1,
          imageable_type: "User",
          image_url: params[:image],
          image_type: "cover"
        )
      end
      respond_to do |format|
        if @image.save
          @success = true
          format.js { }
        else
          format.js {}
        end          
      end
    end
  end
end
