class LikesController < ApplicationController
    before_action :logged_in_user

    def create
        @user = User.find(params[:id])
        @like = Like.create(like_id: current_user.id, liked_id: @user.id, answer_id: params[:answer])
        @user.point += 1
        @user.save
        flash[:success] = "お礼ポイントを付与しました"
        redirect_to micropost_path(params[:micropost])
    end

    # def destroy
    # end

end
