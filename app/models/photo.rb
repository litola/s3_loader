require 'shrine'
class Photo < ApplicationRecord
  include ImageUploader::Attachment.new(:image)#[:image adds a virtual attribute that will be used when constructing a form.]

end
