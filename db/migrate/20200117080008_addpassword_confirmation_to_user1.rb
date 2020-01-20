class AddpasswordConfirmationToUser1 < ActiveRecord::Migration[6.0]
  def change
  	add_column :user1s, :password_confirmation, :string
  end
end
