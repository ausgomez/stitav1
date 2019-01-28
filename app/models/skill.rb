class Skill < ApplicationRecord
    belongs_to :member, optional: false
end
