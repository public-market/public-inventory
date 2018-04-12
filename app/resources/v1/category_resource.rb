module V1
  class CategoryResource < JSONAPI::Resource
    attributes :name, :full_name
    key_type :string

    has_one :parent, class_name: 'Category', foreign_key: :parent_id
    has_many :children, class_name: 'Category', foreign_key: :parent_id
    has_many :items

    def id
      CGI.escape(super)
    end

    def self._primary_key
      :permalink
    end

    delegate :id, to: :parent, prefix: true

    def full_name
      @model.pretty_name
    end
  end
end
