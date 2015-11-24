require 'rails_helper'
include RandomData

RSpec.describe SponsoredPost, type: :model do
  let(:sponsored_post) { SponsoredPost.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99)}

  describe "attributes" do
    it "should respond to title" do
      expect(sponsored_post).to respond_to(:title)
    end

    it "should respond to body" do
      expect(sponsored_post).to respond_to(:body)
    end

    it "should respond to price" do
      expect(sponsored_post).to respond_to(:price)
    end
  end
end
