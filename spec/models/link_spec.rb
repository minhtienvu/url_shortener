require 'rails_helper'

RSpec.describe User, type: :link do
  describe 'validations' do
    context "Validate original url" do
      context "Validate presence of original_url" do
        it 'original_url is empty' do
          # Return false
        end

        it 'original_url is present' do
          # Return true
        end
      end

      context "Validate format of original_url" do
        it 'original_url format is invalid' do
          # Return false
        end

        it 'original_url format is valid' do
          # Return true
        end
      end
    end

    context "Validate short url" do
      context "Validate presence of short_url" do
        it 'short_url is empty' do
          # Return false
        end

        it 'short_url is present' do
          # Return true
        end
      end

      context "Validate format of short_url" do
        it 'short_url format is invalid' do
          # Return false
        end

        it 'short_url format is valid' do
          # Return true
        end
      end

      context "Validate uniqueness of short_url" do
        it 'short_url is existed' do
          # Return false
        end

        it 'short_url is a new one' do
          # Return true
        end
      end
    end
  end
end
