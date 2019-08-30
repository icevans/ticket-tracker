class CommentsController < ApplicationController
  before_action :set_comment, except: :create

  def create
    ticket = Ticket.find(params[:ticket_id])
    comment = Comment.new(ticket_params)
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
    if @comment.update(ticket_params)
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

  def ticket_params
    params.require(:comment).permit(:body, ticket_attributes: %i[status id])
  end
end
