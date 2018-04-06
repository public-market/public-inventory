module V1
  class ItemsController < ApplicationController
    def index
      items = Item.all
      jsonapi_render json: items
    end

    def show
      item = Item.find(params[:id])
      jsonapi_render json: item
    end
  end
end
