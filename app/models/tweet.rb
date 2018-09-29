class Tweet < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :content, presence: true, length: { maximum: 144 }
  acts_as_votable
  
end
