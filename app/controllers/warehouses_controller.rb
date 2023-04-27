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
            render 'new'
        end
    
        #2 - Criar galpão com os dados recebidos 
        
        #3 - redirecionar para root path
        # flash[:notice] = "Galpão cadastrado com sucesso" 
    end

    def edit 
        @warehouse = Warehouse.find(params[:id])

    end
    def update
        warehouse = Warehouse.find(params[:id])
       if warehouse.update(params.require(:warehouse).permit(
            :name,:code,:city,:description,:address, :cep, :area
        ))
        redirect_to warehouse_path(warehouse), notice: 'Galpão atualizado'
       end
        
    end

    def process_form
        cep = params[:cep]
        cep_regex = /\A\d{5}-\d{3}\z/
        if cep_regex.match(cep)
          return true
        else
          flash[:error] = "O CEP deve estar no formato 00000-000"
          render :new
        end
      end

end