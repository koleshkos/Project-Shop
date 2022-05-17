# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product!, only: %i[show edit update restore add_to_cart]
  before_action :initialize_session

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

  def add_to_cart
    id = params[:id].to_i

    session[:cart] << id unless session[:cart].include?(id)
    flash[:success] = "Product #{@product.name} was successfully added to the cart"
    redirect_to products_path
  end

  def remove_from_cart
    id = params[:id].to_i

    session[:cart].delete(id)
    redirect_to load_cart_path
  end

  def load_cart
    @cart = Product.find(session[:cart])
  end

  private

  def set_product!
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :image, :code, :price, :description, :remove_image)
  end

  def initialize_session
    session[:cart] ||= []
  end
end
