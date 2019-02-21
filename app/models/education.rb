class Education < ApplicationRecord
    belongs_to :member, optional: false
    validates :school, presence: true
end
