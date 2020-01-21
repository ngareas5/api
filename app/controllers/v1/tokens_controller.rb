class  V1::TokensController < ApplicationController
	def create
		tokens = []
		user1=User1.find_by(username: params[:username]) 
		if user1&.authenticate(params[:password])
			
				   render json: {jwt: encode_token(id: user1&.id, username: user1&.username, exp: (24.hours.from_now).to_i)}
			
		else
			head :not_found 
		end  
	end

	private
	 
		def encode_token(payload={})
			
			#payload ||= {}
			#exp = 24.hours.from_now
			#payload[:exp] = exp.to_i 
			JWT.encode(payload, Rails.application.secrets.secret_key_base,'HS256')
		end
end
