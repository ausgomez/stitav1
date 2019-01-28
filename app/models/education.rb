class Education < ApplicationRecord
    belongs_to :member, optional: false
end
