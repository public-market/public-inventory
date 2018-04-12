module V1
  class ItemResource < JSONAPI::Resource
    attributes :product_uid, :sku, :title, :quantity, :price, :details, :seller
    key_type :string

    has_many :categories

    filter :title, apply: ->(records, value, _options) {
      records.joins(:product).where('lower(spree_products.name) like lower(?)', "%#{value[0]}%")
    }

    def id
      CGI.escape(super)
    end

    def self._primary_key
      :sku
    end

    def self.sortable_fields(_context)
      []
    end
  end
end
