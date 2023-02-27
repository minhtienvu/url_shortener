require 'rails_helper'
require "spec_helper"

RSpec.describe Api::External::LinksController, type: :controller do

  shared_context "Validate authentication from Api::External::ApplicationController" do
    context "Validate authentication from Api::External::ApplicationController" do
      it "return permission denied error if token is invalid" do
        # Rerturn permission denied error
      end

      it "Pass if token is valid" do
        # Return true
      end
    end

    context '#validate_url_link_valid!' do
      it 'should return error if url param is empty' do
        # Return Error
      end
    end
  end

  describe "POST #encode" do
    include_context "Validate authentication from Api::External::ApplicationController"

    context "Creating a short link" do
      it "should return error when fail to encode" do
        # Return Error
      end

      it "should return object when creating a short link successfully" do
        # Return true + object
      end
    end
  end

  describe "GET #decode" do
    include_context "Validate authentication from Api::External::ApplicationController"

    context "Get a original_url from short_url" do
      it 'Return error if short_url is not found in database' do
        ## Return error
      end

      it 'Return original_url from short_link' do
        ## Return true + original url
      end
    end
  end
end
