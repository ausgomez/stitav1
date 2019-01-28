require "application_system_test_case"

class EducationsTest < ApplicationSystemTestCase
  setup do
    @education = educations(:one)
  end

  test "visiting the index" do
    visit educations_url
    assert_selector "h1", text: "Educations"
  end

  test "creating a Education" do
    visit educations_url
    click_on "New Education"

    fill_in "Degree", with: @education.degree
    fill_in "End", with: @education.end
    fill_in "Info", with: @education.info
    fill_in "Member", with: @education.member_id
    fill_in "School", with: @education.school
    fill_in "Start", with: @education.start
    click_on "Create Education"

    assert_text "Education was successfully created"
    click_on "Back"
  end

  test "updating a Education" do
    visit educations_url
    click_on "Edit", match: :first

    fill_in "Degree", with: @education.degree
    fill_in "End", with: @education.end
    fill_in "Info", with: @education.info
    fill_in "Member", with: @education.member_id
    fill_in "School", with: @education.school
    fill_in "Start", with: @education.start
    click_on "Update Education"

    assert_text "Education was successfully updated"
    click_on "Back"
  end

  test "destroying a Education" do
    visit educations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Education was successfully destroyed"
  end
end
