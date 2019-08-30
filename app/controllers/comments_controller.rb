class CommentsController < ApplicationController
  before_action :set_comment, except: :create
  before_action :set_ticket
  before_action :require_login
  before_action(except: :create) { require_owner(@comment) }

  def create
    @ticket.comments.build(comment_params.merge(user_id: current_user.id))
    @ticket.status = new_status

    if @ticket.save
      flash[:notice] = 'Comment created'
      redirect_to ticket_path(@ticket)
    else
      render 'tickets/show'
    end
  end

  def edit
    @ticket = Ticket.find(params[:ticket_id])
  end

  def update
    if @comment.update(comment_params)
      ticket.status = new_status
      ticket.save

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

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def new_status
    params[:comment][:ticket_attributes][:status]
  end
end
