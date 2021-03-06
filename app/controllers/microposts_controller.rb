class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy

    def show
        @micropost = Micropost.find(params[:id])
        @answers = Answer.where(micropost_id: @micropost.id)
        # @answer = @micropost.answers.build if logged_in?
        # @answers = @micropost.answers.paginate(page: params[:page])
    end

    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            flash[:success] = "投稿が保存されました!"
            redirect_to root_url
        else
            @feed_items = []
            render 'static_pages/home'
        end
    end
    
    def destroy
        @micropost.destroy
        flash[:success] = "マイクロポストを削除しました"
        redirect_to request.referrer || root_url
    end

    private

        def micropost_params
            params.require(:micropost).permit(:content, :picture, :subject)
        end

        # 削除したいマイクロポストが現在ログイン中のユーザーのものか
        # そうでなければホームへリダイレクト
        def correct_user
            @micropost = current_user.microposts.find_by(id: params[:id])
            redirect_to root_url if @micropost.nil?
        end
   
end
