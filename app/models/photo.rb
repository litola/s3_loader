class Photo < ApplicationRecord
  include ImageUploader::Attachment.new(:image)#[:image adds a virtual attribute that will be used when constructing a form.]
  # def download_from_s3 (url_to_s3)
  #   uri = URI(url_to_s3)
  #   response = Net::HTTP.get_response(uri)
  #   File.open("file", 'wb'){|f| f.write(response.body)}
  # end

end
