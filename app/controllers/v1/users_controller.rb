class V1::UsersController < ApplicationController
 
  def index
  	#debugger
   users=User1.all
   user_details = []
   users.each do |user|
   	user_details << {id: user.id, name: user.name, username: user.username, email: user.email}

   end

   render json: user_details, status: :ok 
  end
  def create
  	
  	user=User1.new(params.permit(:username,:password,:password_confirmation,:name,:email))
  	if user.save
  		render json: { status: 200, message: 'user created'}
  	else
      render json: {status: "error",message: user.errors.full_messages.join(',') }
    end
 end
end
