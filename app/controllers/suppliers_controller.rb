class SuppliersController < ApplicationController
    before_action :set_supplier, only:[:edit, :show, :update]
 
    
    def index 
        @suppliers = Supplier.all
    end

    def new 
        @supplier = Supplier.new
    end
    def create
        @supplier = Supplier.new(supplier_params)

        if @supplier.save
            redirect_to suppliers_path, notice: 'Fornecedor cadastrado com sucesso'
        else
            render 'new'
        end
    end

    def show;end

    def edit; end

    def update 
        if @supplier.update(supplier_params)
            redirect_to supplier_path(@supplier), notice: 'Dados atualizados'
        else 
            flash[:notice] = 'Falha ao atualizar'
            render 'edit'
        end
    end
    
    private 
    
    def supplier_params 
        params.require(:supplier).permit(:corporate_name, :brand_name, 
                        :registration_number, :full_address, :city, :state, :email, :cep)
    end

    def set_supplier 
        @supplier = Supplier.find(params[:id])
    end

end
