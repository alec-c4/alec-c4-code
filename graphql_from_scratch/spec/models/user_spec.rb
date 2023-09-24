require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:first_name).on(:update) }
    it { should validate_presence_of(:last_name).on(:update) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end
end
