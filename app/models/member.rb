class Member < ApplicationRecord
    has_one :position
    has_many :experiences
end
