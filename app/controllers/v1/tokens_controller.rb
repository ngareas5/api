class  V1::TokensController < ApplicationController
	def create
		tokens = []
    user1=User1.find_by(username: params[:username]) 
      if user1&.authenticate(params[:password])
        if user1.id.present? && user1.username.present? 
        	tokens = {jwt: encode_token(id: user1&.id, username: user1&.username)}
      	  render json:{tokens: tokens}
      	else
      	  render json: {message: "user not present"}
        end
       else
      	head :not_found 
       end  
     end
        private
         
          def encode_token(payload ={})
          	#debugger
            exp=24.hours.from_now
          payload[:exp]=exp.to_i
          JWT.encode(payload, Rails.application.secrets.secret_key_base)
        end	
end
