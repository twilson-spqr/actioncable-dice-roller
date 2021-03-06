require 'rails_helper'

RSpec.describe Invitation, type: :model do
  context "#invitations" do
    it { should have_valid(:table_id).when(1, 3, 5)}
    it { should_not have_valid(:table_id).when(nil, "")}

    it { should have_valid(:user_id).when(1, 3, 5)}
    it { should_not have_valid(:user_id).when(nil, "")}

    it { should have_valid(:game_master).when(true, false)}
    it { should_not have_valid(:game_master).when(nil, "")}
  end

  context "#associations" do
    it { should belong_to :table}
    it { should belong_to :user}
  end
end
