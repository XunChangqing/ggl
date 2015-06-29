class CommentsController < ApplicationController
  before_action :set_match
  #before_action :set_comment, only: [:show, :edit, :update, :destroy]
  #def new
  #end

  # POST /events
  # POST /events.json
  def create
    @match = Match.find(params[:match_id])
    @comment = @match.comments.build(comment_params)
    @comment.user_name = request.remote_ip
    #@comment.save
    respond_to do |format|
      if @comment.save
        format.html{ redirect_to match_path(@match)}
        format.js {}
        format.json{render json: @comment, status: :created, location: @comment}
      else
        format.html { render action: "new"}
        format.json { render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  private
  def set_match
    @match = Match.find(params[:match_id])
  end
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content)
  end
end
