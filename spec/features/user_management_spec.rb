feature "user can sign up" do

  scenario 'I can sign up as a new user' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, alice@example.com"
    expect(User.first.email).to eq 'alice@example.com'
  end

  scenario 'new user created if password is confirmed' do
    expect{ sign_up(password_confirmation: 'incorrect') }.not_to change(User, :count)
  end

  scenario 'user stays on users page if passwords do not match' do
    expect{ sign_up(password_confirmation: 'incorrect') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'passwords do not match'
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario "I can't sign up with an invalid email address" do
      expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    end

end
