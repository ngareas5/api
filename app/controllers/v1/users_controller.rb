class V1::UsersController < ApplicationController
  
  def index
  	#debugger
   users=User1.all
   user_details = []
   users.each do |user|
   	user_details << {id: user.id, name: user.name, username: user.username}
   end

   render json: user_details, status: :ok 
  end
  def create
  	user1=User1.new(params.permit(:name,:username,:email,:password,:password_confirmation))
  	if user1.save
  		render json: user1, status:  :ok
  	else
      :bad_request 
    end
 end
end
