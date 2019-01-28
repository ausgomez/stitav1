class Award < ApplicationRecord
    belongs_to :member, optional: false
end
