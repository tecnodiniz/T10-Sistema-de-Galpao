class WarehousesController < ApplicationController
    def show 
        @warehouse = Warehouse.find(params[:id])
    end
    def new     
        @warehouse = Warehouse.new
    end
    
    def create 
        #1 - Receber os dados 
        warehouse_params = params.require(:warehouse).permit(:name,:code,:city,:description,:address, :cep, :area)
        @warehouse = Warehouse.new(warehouse_params)

        
        if @warehouse.save
            redirect_to root_path, notice: 'Galpão cadastrado com sucesso'
        else
            flash.now[:notice] = "Falha ao cadastrar"
            render 'new'
        end
    
        #2 - Criar galpão com os dados recebidos 
        
        #3 - redirecionar para root path
        # flash[:notice] = "Galpão cadastrado com sucesso"
        
    end
end