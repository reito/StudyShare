require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  
  def setup
    # answer = answers(:math)
    @user = users(:michael)
    @micropost = microposts(:orange)
    @answer = @micropost.answers.build(content: "中学から数学ですよ", user_id: @user.id)
  end

  test "should be valid" do
    assert @answer.valid?
  end

  test "content should be present" do
    @answer.content = ""
    assert_not @answer.valid?
  end

  test "user id should be present" do
    @answer.user_id = nil
    assert_not @answer.valid?
  end

  test "micropost id should be present" do
    @answer.micropost_id = nil
    assert_not @answer.valid?
  end

  test "content should be at most 140 characters" do
    @answer.content = "a" * 141
    assert_not @answer.valid?
  end

  test "micropost id is correct" do
    assert_equal @answer.micropost_id, @micropost.id
  end

end
