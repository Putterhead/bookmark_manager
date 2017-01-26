# sees a signup form, enters an email and password and submits the form.
# Checks that, when the form is submitted, the browser is directed to the /links page.
# Checks that the /links page shows a welcome message.
# Checks that the user's email address is displayed as part of the welcome message.
# Checks that the User count increases by 1.

feature "Registration of a new user" do
  scenario "adding a sign up form, with email and password" do

    visit "/signup/new"
    fill_in 'email', with: 'pete@gmail.com'
    fill_in 'password', with: 'rabbits&hat'
    expect{click_button('Confirm')}.to change(User, :count).by(1)

    expect(current_path).to eq '/links'

    within 'ul#signup' do
      expect(page).to have_content 'Thank you for registering pete@gmail.com'
    end
  end
end
