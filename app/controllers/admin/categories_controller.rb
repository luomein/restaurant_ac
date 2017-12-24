class Admin::CategoriesController < Admin::BaseController
  #before_action :authenticate_user!
  #before_action :authenticate_admin
  before_action :set_category

  def index
    @categories = Category.all
    #@category = Category.new
    #if params[:id]
    #   @category = Category.find(params[:id])

    #else
    #   @category = Category.new
    #end

  end

  def destroy
    #@category = Category.find(params[:id])
    @category.destroy
    flash[:alert] = "category was successfully deleted"
    redirect_to admin_categories_path
  end

  
  def update
    #@category = Category.find(params[:id])
    if @category.update(category_params)
	redirect_to admin_categories_path
	flash[:notice] = "category was successfully updated"	
    else
	@categories = Category.all
	render :index
    end

  end

  def create 
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "category was successfully created"
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render :index
    end

  end

  private

  def category_params 
    params.require(:category).permit(:name)


  end

  def set_category
    if params[:id]
	@category = Category.find(params[:id])
    else
	@category = Category.new()
    end
  end


end
