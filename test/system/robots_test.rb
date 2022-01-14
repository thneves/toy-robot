require 'application_system_test_case'

class RobotsTest < ApplicationSystemTestCase
  setup do
    @robot = robots(:one)
  end

  test 'visiting the index' do
    visit robots_url
    assert_selector 'h1', text: 'Robots'
  end

  test 'creating a Robot' do
    visit robots_url
    click_on 'New Robot'

    fill_in 'F direction', with: @robot.f_direction
    fill_in 'X location', with: @robot.x_location
    fill_in 'Y location', with: @robot.y_location
    click_on 'Create Robot'

    assert_text 'Robot was successfully created'
    click_on 'Back'
  end

  test 'updating a Robot' do
    visit robots_url
    click_on 'Edit', match: :first

    fill_in 'F direction', with: @robot.f_direction
    fill_in 'X location', with: @robot.x_location
    fill_in 'Y location', with: @robot.y_location
    click_on 'Update Robot'

    assert_text 'Robot was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Robot' do
    visit robots_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Robot was successfully destroyed'
  end
end
