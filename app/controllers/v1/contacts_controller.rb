class V1::ContactsController < ApplicationController
 before_action :set_contact, only: [:show, :update, :destroy]
	def index
		#debugger
		@contacts=Contact.all
		render json: @contacts, status: :ok 
	end 

	def create
		  
		@contact=Contact.new(contact_params)
		
		if @contact.save
	    render json: @contact, status: :created
	   else
		head :not_found

	  end
	 end
	def destroy
		#user = User.where(email: params[:email]).
      @contact.destroy
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

	def contact_params
	
      params.require(:contact).permit(:name,:email)
    end
end
