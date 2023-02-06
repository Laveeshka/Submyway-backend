require 'rails_helper'

RSpec.describe Profile, :type => :model do

    describe "Associations" do
        it { should belong_to(:user).without_validating_presence }
      end

end

