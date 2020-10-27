require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'Associations', type: :model do
    it { is_expected.to belong_to(:article) }
    it { is_expected.to belong_to(:category) }
  end
end
