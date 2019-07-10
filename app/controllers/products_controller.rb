class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  # all shared products varaibles used for left side menu are defined
  # in "defineVariables" method
  before_action :defineVariables

  # GET /products
  # GET /products.json
  def index
    # @products = Product.all
    @products = Product.where(nil).order(id: :asc).paginate(:page => params[:page], :per_page => 25)
    @products = @products.id(params[:id]) if params[:id].present?
    # @products = @products.name_id(params[:name]) if params[:name].present?
    @products = @products.content(params[:content]) if params[:content].present?
    @products = @products.range_min(params[:range_min]) if params[:range_min].present?
    @products = @products.range_max(params[:range_max]) if params[:range_max].present?
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  def missing
    @missing_products = Product.where("qty < 0").paginate(:page => params[:page], :per_page => 25)
    @missing_products = @missing_products.id(params[:id]) if params[:id].present?
    # @missing_products = @missing_products.name_id(params[:name]) if params[:name].present?
    @missing_products = @missing_products.content(params[:content]) if params[:content].present?
    @missing_products = @missing_products.range_min(params[:range_min]) if params[:range_min].present?
    @missing_products = @missing_products.range_max(params[:range_max]) if params[:range_max].present?
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit

  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Produkt został dodany.' }
      else
        format.html { render :new }
      end
    end
  end

  def export_json
    data_export = Product.all.to_json
    send_data data_export, type: 'application/json; header=present', disposition: 'attachment; filename=products.json'
    # redirect_to products_url
  end

  def import_csv
    Product.import(params[:file])
    redirect_to action: 'index'
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Produkt został zaktualizowany.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Produkt został usunięty.' }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :content, :image, :qty, :price_net_buy, :price_net_sell, :product_index, :remove_image, :buy_number, :length, :structure, :gramature, :color, :product_kind)
    end

    # needs to be moved to services!!!!

    def defineVariables
      @LowQtyProducts = Product.where("qty < 0")
    end
end
