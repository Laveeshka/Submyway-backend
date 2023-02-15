class CompaniesController < ApplicationController

    def index
        companies = Company.all
        render json: companies, status: :ok
    end

    def create
        new_company = Company.create!(company_params)
        render json: { company: new_company }, status: :created
    end

    def show
        company = find_company
        render json: { company: company }, status: :ok
    end

    def update
        company = find_company
        company.update!(company_params)
        render json: { company: company }, status: :accepted
    end

    def destroy
        company = find_company
        company.destroy
        render json: { message: "Successfully deleted company" }, status: :ok
    end

    # -------------------------------------------------------------------------------

    private

    def find_company
        company = Company.find_by(id: params[:id])
    end
    
    def company_params
        params.permit(:name)
    end

end
