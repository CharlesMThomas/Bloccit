require 'rails_helper'
include RandomData

RSpec.describe Topic, type: :model do
  let(:topic){ create(:topic) }

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

  context "scopes" do
    before do
      @public_topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)
      @private_topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph, public: false)
    end

    describe "publicaly_viewable" do
      it "should only show pulic topics" do
        expect(Topic.publicaly_viewable).to eq([@public_topic])
      end
    end

    describe "privately_viewable" do
      it "should only show private topics" do
        expect(Topic.privately_viewable).to eq([@private_topic])
      end
    end

    describe "visible_to(user)" do
      it "should show all topics when user is signed in" do
        user = create(:user)
        expect(Topic.visible_to(user)).to eq(Topic.all)
      end
    end

    describe "visible_to(nil)" do
      it "should only show public topcs when no user is signed in" do
        user = nil
        expect(Topic.visible_to(user)).to eq([@public_topic])
      end
    end
  end
end
