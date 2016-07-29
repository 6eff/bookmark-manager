feature "user can sign up" do

  scenario 'I can sign up as a new user' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, alice@example.com"
    expect(User.first.email).to eq 'alice@example.com'
  end

  scenario 'new user created if password is confirmed' do
    expect{ sign_up(password_confirmation: 'incorrect') }.not_to change(User, :count)
  end
end
