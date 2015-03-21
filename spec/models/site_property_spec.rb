require 'rails_helper'

RSpec.describe SiteProperty, type: :model do
  let(:value_json) do
    h = { username: 'expectedUsername', password: 'expectedPassword' }
    h.to_json
  end
  let(:value_json_without_username) do
    h = { password: 'expectedPassword' }
    h.to_json
  end
  let(:value_json_without_password) do
    h = { username: 'expectedUsername' }
    h.to_json
  end
  let(:value_not_json) do
    'not json'
  end
  let(:basic_auth) { create(:site_property, key: SiteProperty::BASIC_AUTH_KEY, value: value_json) }
  let(:basic_auth_without_username) { create(:site_property, key: SiteProperty::BASIC_AUTH_KEY, value: value_json_without_username) }
  let(:basic_auth_without_password) { create(:site_property, key: SiteProperty::BASIC_AUTH_KEY, value: value_json_without_password) }
  let(:basic_auth_value_not_json) { create(:site_property, key: SiteProperty::BASIC_AUTH_KEY, value: value_not_json) }

  context '#basic_auth_username' do
    it 'returns username from value hash' do
      basic_auth
      actual = SiteProperty.basic_auth_username
      expect(actual).to eql('expectedUsername')
    end

    it "returns username as 'admin' when username is not found in value hash" do
      basic_auth_without_username
      actual = SiteProperty.basic_auth_username
      expect(actual).to eql('lacey')
    end

    it "returns username as 'admin' when BASIC_AUTH key is not found" do
      actual = SiteProperty.basic_auth_username
      expect(actual).to eql('lacey')
    end

    it "returns username as 'admin' when value cannot be parsed from json" do
      basic_auth_value_not_json
      actual = SiteProperty.basic_auth_username
      expect(actual).to eql('lacey')
    end
  end

  context '#basic_auth_password' do
    it 'returns password from value hash' do
      basic_auth
      actual = SiteProperty.basic_auth_password
      expect(actual).to eql('expectedPassword')
    end

    it "returns password as 'sunshine' when username is not found in value hash" do
      basic_auth_without_password
      actual = SiteProperty.basic_auth_password
      expect(actual).to eql('sunshine')
    end

    it "returns password as 'sunshine' when BASIC_AUTH key is not found" do
      actual = SiteProperty.basic_auth_password
      expect(actual).to eql('sunshine')
    end

    it "returns password as 'sunshine' when value cannot be parsed from json" do
      basic_auth_value_not_json
      actual = SiteProperty.basic_auth_password
      expect(actual).to eql('sunshine')
    end
  end
end
