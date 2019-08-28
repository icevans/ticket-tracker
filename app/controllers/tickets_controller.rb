class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
