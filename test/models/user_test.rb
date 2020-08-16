require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
    def setup
      @user = User.new(name: "Example User", email: "example@user.com",
                       password: "abcdefg", password_confirmation: "abcdefg")
    end

    test "should be valid" do
     assert @user.valid?
    end

    test "name should be present" do
      @user.name = ""
      assert_not @user.valid?
    end

    test "email should be present" do
      @user.email = ""
      assert_not @user.valid?
    end

    test "name should not be too long" do
      @user.name = "u" * 51
      assert_not @user.valid?
    end
  
    test "email should not be too long" do
      @user.email = "r" * 244 + "@harapekoaomushi.com"
      assert_not @user.valid?
    end
    
    test "email validation should reject invalid addresses" do
      invalid_addresses = %w[user@example,com user_at_abc.org user.name@example.
                             kaikai@ihfe_iefhewui.com, ojewho@bar+lgn.com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
      end
    end

    test "email addresses should be unique" do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      assert_not duplicate_user.valid?
    end

    test "email address should be saved as lower-case" do
      mixed_case_email = "HUB@likeneSS.com"
      @user.email = mixed_case_email
      @user.save
      assert_equal mixed_case_email.downcase, @user.reload.email
    end

    test "password should be present (nonblank)" do
      @user.password = @user.password_confirmation =  " " * 6
      assert_not @user.valid?
    end

    test "password should have a minimum length" do
      @user.password = @user.password_confirmation = "a" * 5
      assert_not @user.valid?
    end

end
