json.extract! member, :id, :fn, :ln, :interests, :address, :phone, :email, :photo, :experience_id, :education_id, :skill_id, :award_id, :user_id, :created_at, :updated_at
json.url member_url(member, format: :json)
