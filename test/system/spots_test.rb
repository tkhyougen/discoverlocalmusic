require "application_system_test_case"

class SpotsTest < ApplicationSystemTestCase
  setup do
    @spot = spots(:one)
  end

  test "visiting the index" do
    visit spots_url
    assert_selector "h1", text: "Spots"
  end

  test "creating a Spot" do
    visit spots_url
    click_on "New Spot"

    fill_in "Country", with: @spot.country
    fill_in "Genre", with: @spot.genre
    fill_in "Image", with: @spot.image
    fill_in "Name", with: @spot.name
    fill_in "Post comment", with: @spot.post_comment
    click_on "Create Spot"

    assert_text "Spot was successfully created"
    click_on "Back"
  end

  test "updating a Spot" do
    visit spots_url
    click_on "Edit", match: :first

    fill_in "Country", with: @spot.country
    fill_in "Genre", with: @spot.genre
    fill_in "Image", with: @spot.image
    fill_in "Name", with: @spot.name
    fill_in "Post comment", with: @spot.post_comment
    click_on "Update Spot"

    assert_text "Spot was successfully updated"
    click_on "Back"
  end

  test "destroying a Spot" do
    visit spots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Spot was successfully destroyed"
  end
end
