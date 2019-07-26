class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.where(nil).paginate(:page => params[:page], :per_page => 25)
    # @clients = @clients.id(params[:id]) if params[:id].present?
    @clients = @clients.client_name(params[:client_name]) if params[:client_name].present?
    @clients = @clients.address_city(params[:address_city]) if params[:address_city].present?
    @clients = @clients.phone_number(params[:phone_number]) if params[:phone_number].present?
    @clients = @clients.company_name(params[:company_name]) if params[:company_name].present?
    @clients = @clients.nip_number(params[:nip_number]) if params[:nip_number].present?

  end

  def show
  end

  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  def create
    @client = Client.new(client_details)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Klient został dodany.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @client.update(client_details)
        format.html { redirect_to @client, notice: 'Dane klienta zostały zaktualizowane.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy

    @client.orders.each do |order|
      order.items.each do |item|
        product = Product.find(item.product_id)
        stack_size = product.qty + item.ordered_product_quantity
        product.update_attributes(qty: stack_size)
      end
    end


    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Klient został usunięty z bazy.' }
    end
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def client_details
      params.require(:client).permit(:client_name, :phone_number, :email, :nip_number, :company_name, :address_city, :address_street, :address_citycode, :address_country, :notes)
    end


end
