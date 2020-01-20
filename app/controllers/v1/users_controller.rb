class V1::UsersController < ApplicationController
  
  def index
  	#debugger
   user1=User1.all
   render json: user1, status: :ok 
  end
  def create
  	user1=User1.new(params.permit(:username,:password,:password_confirmation))
  	if user1.save
  		render json: user1, status:  :ok
  	else
      :bad_request 
    end
 end
end
