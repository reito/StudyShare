require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @micropost = microposts(:ants)
  end

  test "answer created correctly" do
    log_in_as(@user)
    get micropost_path(@micropost)
    assert_select 'a[href=?]', new_answer_path
    
  end

end
