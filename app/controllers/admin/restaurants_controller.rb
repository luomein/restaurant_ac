class Admin::RestaurantsController < Admin::BaseController

  #before_action :authenticate_user!
  #before_action :authenticate_admin
  before_action :set_restaurant, only: [:show, :edit , :update , :destroy]

  def index
    #@restaurants = Restaurant.all
    @restaurants = Restaurant.page(params[:page]).per(10)
  end

  def new 
    @restaurant = Restaurant.new

  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "sucessfully created"
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "failed to create"
      render :new
    end
  end
  
  def show 
    #@restaurant = Restaurant.find(params[:id])
  end

  def edit

  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to admin_restaurant_path(@restaurant)  
      flash[:notice] = "successfully updated"
    else
      render :edit
      flash.now[:alert] = "failed to update"
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path
    flash[:alert] = "restaurant was deleted"
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address , :description , :image , :category_id )
  end
  
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end


end
