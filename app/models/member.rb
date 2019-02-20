class Member < ApplicationRecord
    belongs_to :user
    belongs_to :position
    has_many :experiences
    has_many :skills
    has_many :educations
    has_many :awards

    # We must explicitly have a firstname, lastname and email
    # so later we can generate our own custom_id with those chars
    validates :fn, presence: true
    validates_length_of :fn, minimum: 4

    validates :ln, presence: true
    validates_length_of :ln, minimum: 4

    # requires a valid email
    validates :email, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

    # We must also check that the custom_id and the email are unique 
    validates_uniqueness_of :custom_id
    validates_uniqueness_of :email

    # before saving we want to create a custom id
    before_save :create_custom_id

    # here we are overwriting the to_param rails method to replace id with our own search object
    # more info: https://medium.freecodecamp.org/custom-urls-in-ruby-on-rails-use-descriptive-slugs-instead-of-ids-67c631475a94
    def to_param
        custom_id # instead of the default id
    end

    private

    def create_custom_id
        # generate a random custom_id combining the first 3 letters of the first name 
        # and the first letter of the last name plus a random number from 10 - 99
        self.custom_id = (self.fn[0,4] + self.ln[0,1]).downcase + rand(10..99).to_s
    end
end
