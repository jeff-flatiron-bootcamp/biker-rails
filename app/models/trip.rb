class Trip < ApplicationRecord
  belongs_to :bike
  belongs_to :biker
end
