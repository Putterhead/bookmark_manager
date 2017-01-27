# sees a signup form, enters an email and password and submits the form.
# Checks that, when the form is submitted, the browser is directed to the /links page.
# Checks that the /links page shows a welcome message.
# Checks that the user's email address is displayed as part of the welcome message.
# Checks that the User count increases by 1.

feature "Registration of a new user" do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end
# Fills in an email and password into the user signup form.
# Fills in a mismatching confirmation password into the user signup form.
# Checks that when the form is submitted, no new users are created.
  scenario 'Requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    # expect(current_path).to eq('/users')
    # expect(page).to have_content('Password does not match')
  end
end
