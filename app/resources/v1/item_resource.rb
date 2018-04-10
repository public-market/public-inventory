module V1
  class ItemResource < JSONAPI::Resource
    attributes :product_uid, :title, :quantity, :price, :categories, :details, :seller

    def self._primary_key
      :sku
    end

    def self.sortable_fields(_context)
      []
    end
  end
end
