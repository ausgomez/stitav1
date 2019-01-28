require "application_system_test_case"

class MembersTest < ApplicationSystemTestCase
  setup do
    @member = members(:one)
  end

  test "visiting the index" do
    visit members_url
    assert_selector "h1", text: "Members"
  end

  test "creating a Member" do
    visit members_url
    click_on "New Member"

    fill_in "Address", with: @member.address
    fill_in "Award", with: @member.award_id
    fill_in "Education", with: @member.education_id
    fill_in "Email", with: @member.email
    fill_in "Experience", with: @member.experience_id
    fill_in "Fn", with: @member.fn
    fill_in "Interests", with: @member.interests
    fill_in "Ln", with: @member.ln
    fill_in "Phone", with: @member.phone
    fill_in "Photo", with: @member.photo
    fill_in "Skill", with: @member.skill_id
    fill_in "User", with: @member.user_id
    click_on "Create Member"

    assert_text "Member was successfully created"
    click_on "Back"
  end

  test "updating a Member" do
    visit members_url
    click_on "Edit", match: :first

    fill_in "Address", with: @member.address
    fill_in "Award", with: @member.award_id
    fill_in "Education", with: @member.education_id
    fill_in "Email", with: @member.email
    fill_in "Experience", with: @member.experience_id
    fill_in "Fn", with: @member.fn
    fill_in "Interests", with: @member.interests
    fill_in "Ln", with: @member.ln
    fill_in "Phone", with: @member.phone
    fill_in "Photo", with: @member.photo
    fill_in "Skill", with: @member.skill_id
    fill_in "User", with: @member.user_id
    click_on "Update Member"

    assert_text "Member was successfully updated"
    click_on "Back"
  end

  test "destroying a Member" do
    visit members_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Member was successfully destroyed"
  end
end
