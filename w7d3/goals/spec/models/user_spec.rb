require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:session_token) }

  #associations
  it { should have_many(:aspirations) }
  it { should have_many(:comments) }
   
  #methods
  let!(:user) do
    FactoryBot.create(:user,
    email: 'nickanddrew@appacademyinstructors.io',
    password: 'hunter12')
  end
  describe "find_by_credentials" do
  # find by credentials
  # before {user.save!}
    it 'returns a user given credentials' do
      expect(User.find_by_credentials('nickanddrew@appacademyinstructors.io','hunter12')).to eq(user)
    end

    it 'returns nil given bad credentials' do
      expect(User.find_by_credentials('notnickanddrew@notappacademyinstructors.io', 'password123')).to eq(nil)
    end
  end

  it 'properly resets the session token' do
      token = user.session_token 
      user.reset_session_token!
      expect(user.session_token).to_not eq(token)
  end

  context 'should return true with the correct password' do
    it 'when supplied password is correct' do
        expect(user.is_password?('hunter12')).to be true
    end
    it 'when supplied password is incorrect' do
        expect(user.is_password?('nothunter12')).to be false
    end
  end

end


