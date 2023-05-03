class ProductModelsController < ApplicationController
    
    before_action :set_product_model, only:[:show, :edit,:update]
    def index 
        @product_models = ProductModel.all
    end
    
    def show;end

    def new 
        @product_model = ProductModel.new
    end
    def edit;end

    def update 
        if @product_model.update(product_model_params)
            redirect_to product_model_path(@product_model)
        else
            flash[:notice] = "Não foi possível atualizar"
            render 'edit'
        end
        
    end

    def create 
        @product_model = ProductModel.new(product_model_params)

        if @product_model.save
            redirect_to product_models_path, notice: 'Modelo de produto cadastrado com sucesso'
        else
            render 'new'
        end

    end

    private 

    def product_model_params
        params.require(:product_model).permit(:name, :sku, :weight, :width, :height, :depth, :supplier_id)
    end

    def set_product_model
        @product_model = ProductModel.find(params[:id])
    end

end
