class Category < Spree::Taxon
  self.table_name = :spree_taxons

  belongs_to :parent, class_name: 'Category', foreign_key: :parent_id
  has_many :items, class_name: 'Item', through: :products, source: :variants

  def escaped_id
    CGI.escape(permalink)
  end
end
