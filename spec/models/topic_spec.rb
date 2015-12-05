# == Schema Information
#
# Table name: topics
#
#  id          :integer          not null, primary key
#  name        :string
#  public      :boolean          default(TRUE)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  rating_id   :integer
#

require 'rails_helper'
include RandomData

RSpec.describe Topic, type: :model do
  let(:topic){ Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}

  it { should have_many(:posts)}
  it { should have_many(:labelings) }
  it { should have_many(:labels).through(:labelings) }

  describe "attributes" do
    it "should respond to name" do
      expect(topic).to respond_to(:name)
    end

    it "should respond to description" do
      expect(topic).to respond_to(:description)
    end

    it "should respond to public" do
      expect(topic).to respond_to(:public)
    end

    it "should be public by default" do
      expect(topic.public).to be(true)
    end
  end
end
