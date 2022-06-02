require 'rails_helper'

feature 'Manage appointment', type: :feature do
  before do
    @ap = create(:appointment)
    login_as @ap.doctor
    visit doctor_appointments_path(@ap.doctor)
  end

  scenario 'The Doctor can make a recommendation' do
    expect(page).to_not have_content('Lorem ipsum dolor sit amet, consectetur adipiscing elit')
    click_link @ap.doctor.username
    fill_in 'Recommendation', with: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
    click_button 'Update Appointment'
    expect(page).to have_content('Lorem ipsum dolor sit amet, consectetur adipiscing elit')
  end
end
