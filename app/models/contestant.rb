class Contestant < ApplicationRecord
  validates :first_name, presence: true
  validates :middle_name, presence: true
  validates :last_name, presence: true

  belongs_to :user
  has_many :ratings, dependent: :destroy

  after_create :create_rating!

  def full_name
    #This formats the contestant name like this:
    #ex. Doe, John A.
    "#{last_name}, #{first_name} #{middle_name[0]}."
  end

  private
    def create_rating!
      Rating.create(contestant: self)
    end
end
