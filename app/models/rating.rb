class Rating < ApplicationRecord
  belongs_to :contestant

  EXPOSURE = [
    "Talent",
    "Jeans Wear",
    "Sports Wear",
    "Preliminary QA"    
  ]
end
