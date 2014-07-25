class ReservationsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]
	#before_filter :credentials_filter, :only => [:edit, :destroy]
	
	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = Reservation.new(reservation_params)


		@reservation.save
		redirect_to @reservation
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def index
		@reservations = Reservation.all
	
	end

	def destroy

		redirect_to reservations_path
	end

	private
		def reservation_params
			params.require(:reservation).permit(:restaurant_id, :email, :requested_at, :message)
		end

		# def credentials_filter
		# 		user = Reservation.find(params[:id]).user
		# 		unless user == current_user
		# 		flash[:message] = "Please login with the appropiate credentials"
		# 		redirect_to :root
		# end

end
