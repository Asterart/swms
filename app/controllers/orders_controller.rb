class OrdersController < ApplicationController
  before_action :current_client, only: [:new]

  def index
    @orders = Order.all
  end

  def new
    @clients = Client.all
    @order = Order.new
    @order.items.new
  end

  def choose_client_for_order
    @clients = Client.all
  end

  def create
    client = Client.find(params[:order][:client_id])
    @order = client.orders.build(order_params)


    # stack_size = product.qty - @order.quantity

    respond_to do |format|
      if @order.save
        @order.items.create
        # @order.items.build([{product_id: params[:product_id], ordered_product_quantity: params[:ordered_product_quantity]}])
        # @order = client.orders.last.items
        # @order.items.update([{product_id: params[:product_id], ordered_product_quantity: params[:ordered_product_quantity]}])
        # @order.items.build([{product_id: params[:product_id], ordered_product_quantity: params[:ordered_product_quantity]}])
        # product.update(qty: stack_size)
        # p @order.items
        format.html { redirect_to client, notice: 'Zamówienie zostało dodane.' }
      else
        p @order.errors
        # p Product.find((params[:order][:items_attributes]['0'][:product_id]))
        format.html { redirect_to clients_url, notice: 'Zamówienie zostało odrzucone.' }
      end
    end
  end

  def destroy
    @orders = Order.all
    @order = @orders.find(params[:id])
    # product = Product.find(@order.product_id)
    # stack_size = product.qty + @order.quantity
    # product.update(qty: stack_size)

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
