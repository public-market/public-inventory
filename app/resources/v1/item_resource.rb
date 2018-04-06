module V1
  class ItemResource < JSONAPI::Resource
    # TODO: add taxonomy
    attributes :sku, :uid, :title, :quantity, :price, :condition, :seller
  end
end

