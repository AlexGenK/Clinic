class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: { to_table: 'users' }
      t.references :doctor, null: false, foreign_key: { to_table: 'users' }
      t.text :recommendation
      t.boolean :closed

      t.timestamps
    end
  end
end
