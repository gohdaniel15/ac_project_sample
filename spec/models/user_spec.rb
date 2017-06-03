require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many(:job_listings) }
  it { should validate_presence_of(:username) }

  describe 'validates uniqueness of' do
    subject { User.create(email: 'email@example.com', password: '123123123', first_name: 'john', last_name: 'doe', username: 'johndoe') }

    it { should validate_uniqueness_of(:username) }
  end

  # it 'should validate uniqueness of username' do
  #   let!(:user_1) { User.create(username: 'johndoe') }
  #
  #   subject { User.create(username: 'johndoe') }
  #
  #   expect(subject.errors).not_to be_empty
  #
  # end

end
