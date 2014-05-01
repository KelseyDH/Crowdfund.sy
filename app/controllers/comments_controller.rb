class CommentsController < ApplicationController
  before_action :find_commentable
  before_action :authenticate_user!

  def create
    # @campaign = Campaign.find(params[:campaign_id])
    @comment = @commentable.comments.new(comment_params)

    if @comment.save
      redirect_to @commentable, notice: "Comment Created"
    else
      render "/#{@commentable.class.name.underscore.pluralize}/show"
      #render "/campaigns/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    #resource, id = request.path.split("/")[1, 2]
    #@commentable = resource.singularize.classify.constantize.find(id.to_i)
    if params[:campaign_id]
      @commentable = Campaign.find(params[:campaign_id])
    elsif params[:discussion_id]
      @commentable = Discussion.find(params[:discussion_id])
    end
    # "/campaigns/5/comments"
    # request.path      

  end

end
