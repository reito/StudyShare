require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @micropost = microposts(:ants)
  end

  test "answer created correctly" do
    log_in_as(@user)
    get micropost_path(@micropost)
    assert_difference 'Answer.count', 1 do
      post answers_path, params: { answer: { content: "a", micropost_id: @micropost.id} }
    end
    assert_redirected_to micropost_path(@micropost)
  end

end
