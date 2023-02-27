require 'rails_helper'
require "spec_helper"

RSpec.describe LinksController, type: :controller do

  shared_context 'Validate url param' do
    context "Validate url param" do
      it "Return error if url param is empty" do
        # Return error
      end

      it "Pass validate if url param is passed" do
      end
    end
  end

  describe "POST #encode" do

    include_context 'Validate url param'

    context "Return link if original_url has already been encoded in database" do
      it 'Return short_url from original_url' do
        # Return true + short_url
      end
    end

    context "Generate a new short_url if original_url hasn't existed in database" do
      it 'Return error if creating short link unsuccessfully' do
        # Return false
      end

      it 'Return short_url if creating short link successfully' do
        # Return true + short_url
      end
    end
  end

  describe "GET #decode" do

    include_context 'Validate url param'

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
