class SubscriptionCategoriesController < ApplicationController
    def index
        sub_cats = current_user.subscriptions.subscription_categories
        render json: sub_cats, status: :ok
    end

    def show
        sub_cat = find_sub_cat
        render json: sub_cat, status: :ok
    end

    def create
        sub_cat = SubscriptionCategory.create!(sub_cat_params)
        render json: sub_cat, status: :created
    end

    def update
        sub_cat = SubscriptionCategory.find_by(category_id: params[:id])
        sub_cat.update(sub_cat_params)
        render json: sub_cat, status: :accepted
    end

    def destroy
        sub_cat = SubscriptionCategory.find_by(category_id: params[:id])
        sub_cat.destroy
        render json: {message: "Subscription category was successfully deleted"}, status: :accepted
    end

    private
    def find_sub_cat
        sub_cat = SubscriptionCategory.find_by(id: params[:id])
    end

    def sub_cat_params
        params.permit(:subscription_id, :category_id)
    end

end
