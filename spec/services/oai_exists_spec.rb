require 'rails_helper'

describe OAIExists, type: :service do
  describe "When a record does not exist" do
    it "indicates that it does not exist" do
      expect(OAIExists.new(collection: 'fakiefaker', id: 'nuttin').exists?).to be true
    end
  end

  describe "When a record exists" do
    it "indicates that it does exist" do
      expect(OAIExists.new(collection: 'p16022coll44', id: '1').exists?).to be false
    end
  end
end
