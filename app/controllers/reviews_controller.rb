class ReviewsController < ApplicationController
  
  before_filter :load_product
  before_filter :ensure_logged_in, only: [:edit,:create,:show,:update,:destroy]

  def show
  	@review = Review.find(params[:id])
  end

  def new
  end

  def create
  	@review = @product.reviews.build(params[:review])
    @review.user_id = current_user.id
    binding.pry
  	if @review.save
  		redirect_to @product, notice: "Review created successfully"
  	else 
  		render :show
  	end
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  end

  def edit
  end

  private

  def load_product
  	@product = Product.find(params[:product_id])
  end
end
