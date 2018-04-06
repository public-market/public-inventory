class Item < ApplicationRecord
  self.table_name = :spree_variants

  default_scope { where(is_master: false) }
end
