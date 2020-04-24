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
      @avg = 0
    end

    @spendThisMonth = 0
    client.orders.each do |order|
      if order.created_at.strftime("%m") == Date.today.strftime("%m")
        @spendThisMonth += order.total
      end
    end

  end

  def orderedProducts(client)
    products = []
    client.orders.each do |order|
      order.items.uniq.each do |item|
        products << item.product_id
      end
    end
    @orderedProductsAll = products
  end

  def dailyIncome(what_day)
    @earnedToday = 0
    @lostToday = 0
    Order.all.each do |order|
      if order.created_at.strftime("%d %m") == what_day
        if order.total > 0
          @earnedToday += order.total
        else
          @lostToday += order.total
        end
      end
    end

  end

  def statsChart(client)

  end

end
