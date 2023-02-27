require 'rails_helper'
require "spec_helper"

RSpec.describe Api::External::AuthenticationController, type: :controller do

  before do
    context "Skip validate authentication from Api::External::ApplicationController" do
      it "return permission denied error if token is invalid" do
        # Rerturn permission denied error
      end

      it "Pass if token is valid" do
        # Return true
      end
    end
  end

  describe "#login" do
    context "Return Unauthorized error if user has not authenticated" do
      # return authentication error
    end

    context "Return token json if user has authenticated" do
      # return token json
    end
  end
end
