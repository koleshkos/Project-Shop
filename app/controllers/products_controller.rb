# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product!, only: %i[show edit update restore buy]

  def index
    @products = Product.paginate(page: correct_page(params[:page].to_i, Product.count), per_page: PER_PAGE)
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def update
    if @product.update product_params
      flash[:success] = 'Product updated!'
      redirect_to products_path
    else
      render :edit
    end
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = 'Product created!'
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    if request.xhr?
      params[:product_ids].each do |id|
        Product.find(id).deleted!
      end
      flash[:danger] = 'Selected products deleted!'
    else
      Product.find(params[:id]).deleted!
      flash[:danger] = 'Product deleted!'
      redirect_to products_path
    end
  end

  def restore
    @product.active!
    flash[:success] = 'Product restored!'
    redirect_to products_path
  end

  def buy
    flash[:success] = "Product #{@product.name} was successfully added to the cart"
    redirect_to products_path
  end

  private

  def set_product!
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :image, :code, :price, :description, :remove_image)
  end
end
