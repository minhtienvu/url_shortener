require 'rails_helper'
require "spec_helper"

RSpec.describe Api::External::ApplicationController, type: :controller do
  describe "#authenticate_request!" do
    context "Validate authentication" do
      it "return permission denied error if token is invalid" do
        # Rerturn permission denied error
      end

      it "Pass if token is valid" do
        # Return true
      end
    end
  end

  describe "#render_data" do
    context "Render json success format from data and message" do
      # Render json success format
    end
  end

  describe "#render_error" do
    context "Render json format with errors from data and message" do
      # render json format with errors
    end
  end
end
