class WarehousesController < ApplicationController
    before_action :set_warehouse, only:[:show,:edit,:update]

    def show; end

    def new     
        @warehouse = Warehouse.new
    end
    
    def create 
        #1 - Receber os dados 
        @warehouse = Warehouse.new(warehouse_params)

        
        if @warehouse.save
            redirect_to root_path, notice: 'Galpão cadastrado com sucesso'
        else
            render 'new'
        end
    
        #2 - Criar galpão com os dados recebidos 
        
        #3 - redirecionar para root path
        # flash[:notice] = "Galpão cadastrado com sucesso" 
    end

    def edit; end

    def update

       if @warehouse.update(warehouse_params)
        redirect_to warehouse_path(@warehouse), notice: 'Galpão atualizado'
       else
        render 'edit'
       end
        
    end

    private 

    def set_warehouse
        @warehouse = Warehouse.find(params[:id])
    end

    def warehouse_params
        params.require(:warehouse).permit(
            :name,:code,:city,:description,:address, :cep, :area
        )
    end

end