class Experience < ApplicationRecord
    belongs_to :member, optional: false
end
