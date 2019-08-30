class CommentsController < ApplicationController
  before_action :set_comment, except: :create

  def create
    ticket = Ticket.find(params[:ticket_id])
    comment = Comment.new(params.require(:comment).permit(:body))
    comment.ticket = ticket
    comment.creator = current_user

    if comment.save
      flash[:notice] = 'Comment created'
      redirect_to ticket_path(ticket)
    else
      render 'tickets/show'
    end
  end

  def edit
    @ticket = Ticket.find(params[:ticket_id])
  end

  def update
    if @comment.update(params.require(:comment).permit(:body))
      flash[:notice] = 'Comment updated'
      redirect_to ticket_path(params[:ticket_id])
    else
      render 'create'
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
