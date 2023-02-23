class CategoriesController < ApplicationController
    def index
        categories = Category.all.order(:name)
        render json: categories, status: :ok
    end

    def show
        category = find_category
        render json: category, status: :ok
    end

    def create
        new_category = Category.create!(category_params)
        render json: new_category, status: :created
    end

    def update
        category = find_category
        category.update!(category_params)
        render json: category, status: :accepted
    end

    def destroy
        category = find_category
        category.destroy
        render json: {message: "Category was successfully deleted"} status: :accepted
    end

    private

    def find_category
        category = Category.find_by(id: params[:id])
    end

    def category_params
        params.permit(:name, :color)
    end

end
