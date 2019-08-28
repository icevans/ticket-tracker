class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  def create
    ticket = Ticket.new(ticket_params)
    ticket.project = Project.first # TODO: make dynamic

    if ticket.save
      flash[:notice] = 'Ticket created'
      redirect_to tickets_path
    else
      render 'create'
    end
  end

  def new
    @ticket = Ticket.new
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :body, :status)
  end
end
