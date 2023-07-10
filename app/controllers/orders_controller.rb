class OrdersController < ApplicationController
  before_action :set_order, only: %i[edit update is_owner delivery]
  helper_method :is_owner

  def index 
    @orders = Order.where(user_id: current_user.id)
  end
  
  def new
    @order = Order.new
  end

  def edit;end
  
  def update 
    @order = Order.update(params_require)
    redirect_to order_path(@order), notice: 'Pedido editado com sucesso'
  end


  def create
    @order = Order.new(params_require)
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

  def search 
    @orders = Order.where(code: params[:query])
    
    
  end

  def delivery
    @order.update(status: 1)

    if @order.delivered?
      @order.order_items.each do |item|
        WarehouseItem.create!(warehouse: @order.warehouse, product_model: item.product_model, qtd: item.qtd)
      end
      redirect_to order_path(@order), notice: 'Pedido marcado como entregue'
    end
    
   
   
    
  end

  private 

  def set_order
    @order = Order.find(params[:id])
    
  end

  def params_require 
    params.require(:order).permit(:warehouse_id, :supplier_id, :estimate_delivery_date)
  end

  def is_owner 
    current_user == @order.user
  end




end
