class Biker < ApplicationRecord
    has_many :bikes
    has_many :trips
    has_many :comments
end
