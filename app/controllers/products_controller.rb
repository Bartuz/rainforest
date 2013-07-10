class ProductsController < ApplicationController
  
  before_filter :get_product_by_id, only: [:show,:edit,:destroy,:update]
  before_filter :ensure_logged_in, only: [:show]
  def index
    @products = Product.all
    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @products}
    end
  end

  def show
    if current_user
      @review = @product.reviews.build
    end
    
    respond_to do |format|
      format.html #show.html.erb
      format.json { render json: @product }
    end
  end

  def new
    @product = Product.new
    respond_to do |format|
      format.html #new.html.erb
      format.json { render json: @product}
    end
  end

  def create
    @product = Product.new(params[:product])
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Save process completed!" }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { 
          flash.now[:notice]="Save proccess coudn't be completed!" 
          render :new 
        }
        format.json { render json: @product.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.json { render json: @product}
    end
  end

  def update
    respond_to do |format|  
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: "Update process completed!" }
        format.json {  head :no_content }
      else 
        format.html {
          flash.now[:notice]= "Update proccess coudn't be completed!"
          render :edit
        }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_path }
      format.json { head :no_content }
    end
  end

  private

  def get_product_by_id
    @product = Product.find(params[:id])
  end

end
