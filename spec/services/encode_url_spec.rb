module EncodeUrlSpec
  describe "#generate" do
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

  describe "#generate_hash" do
    context "Create a hash from SecureRandom.base58" do
      # Return a string hash with 6 characters
    end
  end

  describe "#generate_expiration_date" do
    context "generate expiration date within 30 days" do
      it "Set expiration date from current time" do
        # Time.current + 30.days
      end
    end
  end

  describe "#generate_full_short_url" do
    context "Generate a full short_url" do
      it "Return a full short_url" do
        # "#{@request.base_url}/#{hash}"
      end
    end
  end
end
