require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:test_user) { User.create(name: 'Example User', password: 'password', password_confirmation: 'password') }
  let(:subject) do
    described_class.new(
      title: 'Example title',
      text: 'example text',
      AuthorId: test_user.id,
      image: nil
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'Content cannot be less than 10' do
      subject.text = 'text'
      expect(subject).not_to be_valid
    end
  end

  describe 'Associations', type: :model do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:votes) }
    it { is_expected.to have_many(:tags) }
    it { is_expected.to have_many(:categories) }
  end
  describe 'Validations', type: :model do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:text) }
  end
end
