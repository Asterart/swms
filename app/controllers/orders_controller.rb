class OrdersController < ApplicationController
  before_action :current_client, only: [:new]

  def index
    @orders = Order.all
  end

  def new
    @clients = Client.all
    @order = Order.new
    5.times do
      @order.items.new
    end
  end

  def choose_client_for_order
    @clients = Client.all
  end

  def create
    client = Client.find(params[:order][:client_id])
    @order = client.orders.build(order_params)

    respond_to do |format|
      if @order.save
        @order.items.each do |item|
          product = Product.find(item.product_id)
          stack_size = product.qty - item.ordered_product_quantity
          product.update_attributes(qty: stack_size)
        end
        format.html { redirect_to client, notice: 'Zamówienie zostało dodane.' }
      else
        p @order.errors
        format.html { redirect_to clients_url, notice: 'Zamówienie zostało odrzucone.' }
      end
    end
  end

  def destroy
    @orders = Order.all
    @order = @orders.find(params[:id])
    @order.items.each do |item|
      product = Product.find(item.product_id)
      stack_size = product.qty + item.ordered_product_quantity
      product.update_attributes(qty: stack_size)
    end

    @order.destroy
    respond_to do |format|
      # format.html { redirect_back(fallback_location:"/"), notice: 'Zamówienie zostało usunięty z bazy.' }
      format.html { redirect_back(fallback_location:"/") }
    end
  end

  private

  def order_params
    # params.require(:order).permit(:client_id, :created_at)
    # params[:order][:product_id] ||= []
    params.require(:order).permit(:client_id, :total, :delivery, :user_id, :notes, items_attributes: Item.attribute_names.map(&:to_sym).push(:_destroy), payment:[])
  end

  def current_client
    @current_client = Client.find(params[:client])
  end

end
