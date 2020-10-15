require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end
  
  test "micropost interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # 無効な送信
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { content: "", subject: "" } }
    end
    # 有効な送信
    content = "小学校は算数、中学校からは数学。"
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params: { micropost: { content: content,
                                                   subject: "2" } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # 投稿を削除する
    assert_select 'a', text: '削除する'
    first_micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
    # 違うユーザーのプロフィールにアクセス
    get user_path(users(:archer))
    assert_select 'a', text: '削除する', count: 0
  end

  test "micropost sidebar count" do
    log_in_as(@user)
    get root_path
    # assert_match "#{@user.microposts.count} microposts", response.body
    # まだマイクロポストを投稿していないユーザー
    @other_user = users(:malory)
    log_in_as(@other_user)
    get root_path
    assert_match "0", response.body
    @other_user.microposts.create!(content: "f(x)=3x^2-4", subject: "2")
    get root_path
    assert_match "1", response.body
  end

end
