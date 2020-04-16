class Trip < ApplicationRecord
  belongs_to :bike
  belongs_to :biker
  has_many :trip_comments
  has_many :bikers, through: :trip_comments

  accepts_nested_attributes_for :trip_comments #, :reject_if => lambda { |c| c[:comment].blank? }

  def trip_comments_attributes=(trip_comment_attributes)
    trip_comment_attributes.values.each do |trip_comment_attributes|
      if trip_comment_attributes["comment"].present?
        trip_comment = TripComment.create(trip_comment_attributes)
        self.trip_comments << trip_comment
      end
    end
  end

  def newest_comments
    self.trip_comments.order(updated_at: :desc)
  end

  def timestamp
    super.in_time_zone(timezone) if super
  end

  # def artist_name=(name)
  #   self.artist = Artist.find_or_create_by(name: name)
  # end

  # def artist_name
  #   if artist
  #     self.artist.name
  #   end
  # end


end
