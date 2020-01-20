class Addnametouser1 < ActiveRecord::Migration[6.0]
  def change
  		add_column :user1s, :name, :string
  	    add_column :user1s, :email, :string
  end
end
