class CommentsController < ApplicationController
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
end
