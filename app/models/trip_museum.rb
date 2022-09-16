class TripMuseum < ApplicationRecord
  belongs_to :trip
  belongs_to :museum
end
