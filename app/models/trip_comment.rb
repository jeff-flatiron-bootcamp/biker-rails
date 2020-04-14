class TripComment < ApplicationRecord
  belongs_to :trip
  belongs_to :biker
end
