class OrdersController < ApplicationController
  before_action :current_client, only: [:new]

  def index
    @orders = Order.all
  end

  def new
    @clients = Client.all
    @order = Order.new
  end

  def choose_client_for_order
    @clients = Client.all
  end

  def create
    client = Client.find(params[:order][:client_id])
    @order = client.orders.build(order_params)
    product = Product.find((params[:order][:product_id]))
    stack_size = product.qty - @order.quantity

    respond_to do |format|
      if @order.save
        product.update(qty: stack_size)
        format.html { redirect_to client, notice: 'Zamówienie zostało dodane.' }
      else
        format.html { redirect_to clients_url, notice: 'Zamówienie zostało odrzucone.' }
      end
    end
  end

  def destroy
    @orders = Order.all
    @order = @orders.find(params[:id])
    product = Product.find(@order.product_id)
    stack_size = product.qty + @order.quantity
    product.update(qty: stack_size)

    @order.destroy
    respond_to do |format|
      # format.html { redirect_back(fallback_location:"/"), notice: 'Zamówienie zostało usunięty z bazy.' }
      format.html { redirect_back(fallback_location:"/") }
    end
  end

  private

  def order_params
    # params.require(:order).permit(:client_id, :created_at)
    params[:order][:product_id] ||= []
    params.require(:order).permit(:client_id, :total, :quantity, :product_id, :delivery, :user_id, :notes, payment:[])
  end

  def current_client
    @current_client = Client.find(params[:client])
  end

end
