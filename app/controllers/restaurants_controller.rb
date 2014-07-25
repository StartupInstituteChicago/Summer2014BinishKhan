class RestaurantsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]
	#before_filter :credentials_filter, :only => [:edit, :destroy]

	def new
		@restaurant = Restaurant.new
		@s3_direct_post = S3_BUCKET.presigned_post(key:
		 "uploads/#{SecureRandom.uuid}/${filename}",
		  success_action_status: 201, acl: :public_read)
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)

		if @restaurant.save
			redirect_to @restaurant
		else
			render 'new'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@can_edit = @restaurant.user == current_user
	end

	def index
		@restaurants = Restaurant.all
	end

	def edit
  		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])

		if @restaurant.update(restaurant_params)
			redirect_to @restaurant
		else
			render 'edit'
		end
	end

	def destroy
	  @restaurant = Restaurant.find(params[:id])
	  @restaurant.destroy

	  redirect_to restaurants_path
	end

	private
  		def restaurant_params
    	params.require(:restaurant).permit(:name, :description,
    	 :address, :city, :state, :zipcode, :phone, :image, :remote_image_url).merge(user_id: current_user.id)
  		end

  # 		def credentials_filter
		# 		user = Restaurant.find(params[:id]).user
		# 		unless user == current_user
		# 		flash[:message] = "Please login with the appropiate credentials"
		# 		redirect_to :root
		# end
end
