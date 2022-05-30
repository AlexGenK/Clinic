class AddUsernameAndRolesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :user_role, :boolean, default: true
    add_column :users, :doctor_role, :boolean, default: false
    add_column :users, :admin_role, :boolean, default: false
  end
end
