module OpenInventoryApi
  module SchemaDumper
    def ignored?(table_name)
      !['spree_variants'].include?(table_name)
    end
  end
end

# ActiveRecord::SchemaDumper.prepend(OpenInventory::SchemaDumper)
