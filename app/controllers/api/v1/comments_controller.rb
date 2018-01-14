module Api
    module V1
        class CommentsController < Api::V1::ApplicationController

        def destroy
            @comment = @current_user.comments.find_by(params[:id])
            if @comment
                @comment.destroy
            else
              render json: {post: "not found"}, status: :not_found
            end
        end
    
        def create
            comment= Comment.new(comment_params)
            comment.user = @current_user
    
            comment.save
    
            render json: comment
        end

        private
            def comment_params
                params.require(:comment).permit(:text)
            end
    
            def comment
                CommentDecorator.new(Comment.find(params[:id]))
            end
        end
    end
  end