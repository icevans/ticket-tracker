class AddAssigneeRefToTickets < ActiveRecord::Migration[6.0]
  def change
    add_reference :tickets, :assignee, foreign_key: { to_table: :users }
  end
end
