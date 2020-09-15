class AnswersController < ApplicationController
    before_action :logged_in_user
    
    # def index
    #     @micropost = Micropost.find(params[:micropost_id])
    #     @answers = @micropost.answers
    #     @answer = current_user.answers.build if logged_in?
    #     # if @answer.save
    #     #     flash[:success] = "回答が作成されました"
    #     #     redirect_to micropost_path(@micropost)
    #     # else
    #     #     render 'microposts/show'
    #     # end
    # end

    def new
        @answer = Answer.new
    end

    def create
        # @micropost = Micropost.find(params[:micropost_id])
        @answer = current_user.answers.build(content: params[:answer][:content], micropost_id: params[:micropost_id])
        # @answer = current_user.answers.build(answer_params)
        if @answer.save
            flash[:success] = "回答が作成されました"
            redirect_to micropost_path(@answer.micropost)
        else
            render 'microposts/show'
        end
    end

    
    def destroy
        @answer.destroy
        flash[:success] = "回答が削除されました"
        redirect_to 
    end

    private

        def answer_params
            params.required(:answer).permit(:content)
        end

end
