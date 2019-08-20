module ProductsHelper

    def sold(id)
      @totalOrdered = Order.all.joins(:items).where('items.product_id = ?', id).where('items.ordered_product_quantity > ?', 0)
    end
end
