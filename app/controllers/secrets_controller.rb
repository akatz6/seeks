class SecretsController < ApplicationController
	def index
		@secrets = Secret.all
	end

	def new

	end

	def create
		@secret = Secret.new(content: params[:content], user: current_user)
		if @secret.save
			flash["success"] = "Secrets added!" 
		else
			puts "\n\n\n\n#{@secret.errors.messages}"
		end
		redirect_to current_user
	end

	def destroy
	@secrets = Secret.find(params[:id])
    @secrets.destroy
    session[:secret_id] = nil
     redirect_to user_path
	end
end
