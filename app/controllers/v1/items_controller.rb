module V1
  class ItemsController < ApiController
    def index
      items = Item.all
      jsonapi_render json: items
    end

    def show
      item = Item.find_by!(sku: params[:id])
      jsonapi_render json: item
    end
  end
end
