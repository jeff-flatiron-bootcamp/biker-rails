class Biker < ApplicationRecord
    has_many :bikes
    has_many :trips
    has_many :comments

    validates :first_name, format: {with: /\D+/, message: " can only contain alpha characters."}, allow_blank: true
    validates :last_name, format: {with: /\D+/, message: " can only contain alpha characters."}, allow_blank: true
    validates :user_name, format: {without: /\s+/, message: " can not have spaces."} 
    validates :user_name, presence: true
    validates :user_name, uniqueness: true

    def biker_full_name
        "#{self.first_name} #{self.last_name}"
    end

    def total_trip_distances
        self.trips.map{|trip| trip.distance_miles.to_f.round(2)}.reduce{|sum, next_i| sum + next_i}                
    end

    def trips_newest_first
        self.trips.order(updated_at: :desc)
      end
end
