class AddRefCategoriesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :category, null: true, foreign_key: true
  end
end
