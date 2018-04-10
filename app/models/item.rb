class Item < Spree::Variant
  self.table_name = :spree_variants

  default_scope { where(is_master: false).includes(:product) }

  belongs_to :vendor, class_name: 'Vendor'

  def product_uid
    product.number
  end

  def title
    product.name
  end

  def quantity
    total_on_hand
  end

  def details
    options_text
  end

  def categories
    product.taxons.map(&:pretty_name)
  end

  def seller
    vendor&.name
  end
end
