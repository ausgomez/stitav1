class Member < ApplicationRecord
    belongs_to :user
    belongs_to :position
    has_many :experiences
    has_many :skills
    has_many :educations
    has_many :awards
end
