require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    context "Validate name" do
      context "Validate presence of name" do
        it 'name is empty' do
          # Return false
        end

        it 'name is present' do
          # Return true
        end
      end
    end

    context "Validate email" do
      context "Validate presence of email" do
        it 'email is empty' do
          # Return false
        end

        it 'email is present' do
          # Return true
        end
      end

      context "Validate format of email" do
        it 'email format is invalid' do
          # Return false
        end

        it 'email format is valid' do
          # Return true
        end
      end

      context "Validate uniqueness of email" do
        it 'email is existed' do
          # Return false
        end

        it 'email is a new one' do
          # Return true
        end
      end
    end

    context "Validate password" do
      context "validate presence of password" do
        it 'password is empty' do
          # Return false
        end

        it 'password is present' do
          # Return true
        end
      end

      context "password has the length at least 6 characters" do
        it 'the length of password is smaller than 6' do
          # Return false
        end

        it 'the length of password is equal 6' do
          # Return true
        end

        it 'the length of password is greater than 6' do
          # Return true
        end
      end

      context "password need to be encrypted when saving to database" do
        it 'password did not be encrypted' do
          # Return false
        end

        it 'password has be encrypted' do
          # Return true
        end
      end
    end

    context "Validate username" do
      context "should validate presence of username" do
        it 'username is empty' do
          # Return false
        end

        it 'username is present' do
          # Return true
        end
      end

      context "should uniqueness of username" do
        it 'username is existed' do
          # Return false
        end

        it 'username is a new one' do
          # Return true
        end
      end
    end
  end
end
