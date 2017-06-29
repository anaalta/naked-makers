require 'rails_helper'

RSpec.feature "DB addition",  type: :feature do

  scenario "Can see responses page", type: :feature do
    visit('/')
    click_on('Submit Data')
    fill_in "response_city", with: "London"
    check('1')
    click_on 'Submit Response'
    visit ('/home/language_data')
    expect(page).to have_content("[{\"name\":\"Ruby\",\"count\":1}]")

  end
end
