class Bike < ApplicationRecord
  belongs_to :biker
  belongs_to :manufacturer
end
