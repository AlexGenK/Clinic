class ChangeClosedDefaultToAppointments < ActiveRecord::Migration[6.1]
  def change
    change_column_default :appointments, :closed, false 
  end
end
