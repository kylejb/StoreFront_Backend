class ItemsController < ApplicationController
    before_action :find_item, except: [:index, :new, :edit]
    skip_before_action :authorized, only: [:index, :show]

    def index
        @items = Item.all

        render json: @items
    end

    def show
        render json: @item
    end

    private

    def item_params
        params.require(:items).permit(:name, :img_url, :cost, :description)
    end

    def find_item
        @item = Item.find(params[:id])
    end
end

