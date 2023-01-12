class User < ApplicationRecord
  has_many :images, as: :imageable


  def profile_pic_available?
    Image.find_by(imageable_type: "User", imageable_id: 1, image_type: "profile").present?
  end

  def cover_pic_available?
    Image.find_by(imageable_type: "User", imageable_id: 1, image_type: "cover").present?
  end

  def profile_pic
    Image.find_by(imageable_type: "User", imageable_id: 1, image_type: "profile")    
  end

  def cover_pic
    Image.find_by(imageable_type: "User", imageable_id: 1, image_type: "cover")
  end

  def profile_pic_url
    profile_pic_available? ? profile_pic.image_url.url : "default_pic.png"
  end


  def cover_pic_url
    cover_pic_available? ? cover_pic.image_url.url : "default_pic.png"    
  end

end















# def profile_pic_available?   # always return true or false
#   images.where(imageable_type: "Profile").first.present?
# end 

# def cover_available?
#   images.where(imageable_type: "Cover").first.present?
# end

# def image_url
#   profile_image  = images.where(imageable_type: "Profile").first
#   profile_image.nil? ? "" : profile_image.profile_pic.url
# end 

# def image_url1
#   cover_image  = images.where(imageable_type: "Cover").first
#   cover_image.nil? ? "" : cover_image.cover_pic.url
# end


# def image_url
#   profile_image  = Image.find_by(imageable_type: "profile", imageable_id: self.id)
#   profile_image.nil? ? "" : profile_image.profile_pic.url
# end 

# def image_url1
#   cover_image  = images.where(imageable_type: "Cover").first
#   cover_image.nil? ? "" : cover_image.cover_pic.url
# end


