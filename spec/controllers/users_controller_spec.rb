require 'rails_helper'
require "spec_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    context "Return all users" do
      # return all users
    end
  end

  describe "GET #show" do
    context "Return user by id" do
      # return user
    end
  end

  describe "POST #create" do
    context "Validation" do
      context "Validate email param" do
        context "email is empty" do
          # Return error
        end

        context "email is existed in database" do
          # Return error
        end

        context "email is valid" do
          # Return true
        end
      end

      context "Validate password param" do
        context "password is empty" do
          # Return error
        end

        context "the length of password is less than six" do
          # Return error
        end

        context "the length of password is equal six" do
          # return true
        end

        context "the length of password is more than six" do
          # return true
        end
      end

      context "Validate user_name param" do
        context "user_name is empty" do
          # Return error
        end

        context "user_name is existed in database" do
          # Return error
        end

        context "user_name is valid" do
          # Return true
        end
      end
    end

    context "Create a user successfully" do
      it "Return user json" do
        # return user json
      end
    end
  end

  describe "PUT #update" do
    context "Validation" do
      context "Validate email param" do
        context "email is empty" do
          # Return error
        end

        context "email is existed in database" do
          # Return error
        end

        context "email is valid" do
          # Return true
        end
      end

      context "Validate password param" do
        context "password is empty" do
          # Return error
        end

        context "the length of password is less than six" do
          # Return error
        end

        context "the length of password is equal six" do
          # return true
        end

        context "the length of password is more than six" do
          # return true
        end
      end

      context "Validate user_name param" do
        context "user_name is empty" do
          # Return error
        end

        context "user_name is existed in database" do
          # Return error
        end

        context "user_name is valid" do
          # Return true
        end
      end
    end

    context "Update a user successfully" do
      it "Return user json" do
        # return user json
      end
    end
  end

  describe "DELETE #destroy" do
    context 'user_id is not existed in database' do
      # Return error
    end

    context "user_id is existed in database" do
      it "Return success message after deleting a user successfully" do
        # Return success message
      end
    end
  end

  describe "#user_params" do
    context "return error if any param is not permitted" do
      # return error
    end

    context "Return user params if params are permitted" do
      # return true
    end

  end

  describe "#set_user" do
    context "Return not found error if user is not found" do
      # Return not found error
    end

    context "Return user if user is found" do
      # Return user
    end
  end
end
