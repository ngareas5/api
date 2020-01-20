class  V1::TokensController < ApplicationController
	def create
     user1=User1.find_by(username: params[:username])
        
      if user1&.authenticate(params[:password])
         
      	render json:{

          jwt: encode_token({id: user1.id, username: user1.username})
      }

       else
      	head :not_found
        
       end
        
     end
        private
          
          def encode_token(payload ={})

          exp=	24.hours.from_now
          payload[:exp]=exp.to_i
          JWT.encode(payload, Rails.application.secrets.secret_key_base)
        end	
end
