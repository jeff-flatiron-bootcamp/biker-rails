class Bike < ApplicationRecord
  belongs_to :biker
  belongs_to :manufacturer  
  has_many_attached :images


  # def images=(image)    
  #   byebug
  #   #new_image = Image.create(image)
  #   #self.images.build(image.as_json)
  # end

    # def trip_comments_attributes=(trip_comment_attributes)
    #   trip_comment_attributes.values.each do |trip_comment_attributes|
    #     if trip_comment_attributes["comment"].present?
    #       trip_comment = TripComment.create(trip_comment_attributes)
    #       self.trip_comments << trip_comment
    #     end
    #   end
    # end

end
