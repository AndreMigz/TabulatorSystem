class Rating < ApplicationRecord
  belongs_to :rateable, polymorphic: true

  EXPOSURE = [
    "Talent",
    "Jeans Wear",
    "Sports Wear",
    "Preliminary QA"    
  ]
end
