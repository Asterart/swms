module ProductsHelper

    def sold(id)
      @totalOrdered = Order.all.joins(:items).where('items.product_id = ?', id)
      # @totalOrdered = Order.all.joins(:items).where('items.product_id = ? AND items.ordered_product_quantity > ?', id, 0)

      # @totalOrderedUnits = Order.all.includes(:items).where('items.product_id = ?', id)
      # @totalOrderedUnitsSum = []
      #     @totalOrderedUnits.ids.each do |single_order|
      #       @totalOrderedUnitsSum << Order.find_by(id: single_order).ordered_product_quantity
      #     end
    end
end
