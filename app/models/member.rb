class Member < ApplicationRecord
    has_one :position
    has_many :experiences
    has_many :skills
    has_many :educations
    has_many :awards
end
