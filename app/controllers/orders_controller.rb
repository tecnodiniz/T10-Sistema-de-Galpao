class OrdersController < ApplicationController


    def new 
        @order = Order.new
    end

    def create
        @order = Order.new(params.require(:order).permit(:warehouse_id,:supplier_id, :estimate_delivery_date))
        @order.user = current_user

        if @order.save
            redirect_to @order, notice: 'Pedido registrado com sucesso'
        else
            render 'new'
        end
        
    
    end
    def show 
        @order = Order.find(params[:id])
    end
    
end