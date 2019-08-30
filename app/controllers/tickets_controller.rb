class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  def index
    filter = request.query_parameters.delete_if do |_, value|
      ['', 'Filter'].include? value
    end

    if filter.has_key? :tag_id
      filter[:tags] = { id: filter[:tag_id] }
      filter.delete(:tag_id)
    end

    if filter.empty?
      @tickets = Ticket.all
    else
      @tickets = Ticket.joins(:tags).where(filter)
    end

    respond_to do |format|
      format.js { render 'tickets.js.erb' }
      format.html { render }
    end
  end

  def show
    @comment = Comment.new
    @comment.ticket = @ticket
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    ticket = Ticket.new(ticket_params)
    ticket.creator = current_user

    if ticket.save
      flash[:notice] = 'Ticket created'
      redirect_to tickets_path
    else
      render 'new'
    end
  end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = 'Ticket updated'
      redirect_to ticket_path(@ticket)
    else
      render 'edit'
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = 'Ticket deleted'
    redirect_back fallback_location: tickets_path
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:project_id, :name, :body, :status, :assignee_id, tag_ids:[])
  end
end
