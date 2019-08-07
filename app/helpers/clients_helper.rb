module ClientsHelper

  def totalStats(client)

    @totalOrderSum = 0
    client.orders.each do |order|
      @totalOrderSum += order.total
    end


    if client.orders.size > 0
      totalNumberOfOrders = 0
      client.orders.each do |order|
        if order.total > 0
          totalNumberOfOrders += 1
        end
      end
      @avg = (@totalOrderSum/totalNumberOfOrders).round(2)
    else
      @arg = 0
    end

  end


  def orderedProducts(client)
    @products = []
    client.orders.each do |order|
      order.items.each do |item|
        @products << item
      end
    end
  end

end
