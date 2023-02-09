class SubscriptionsController < ApplicationController
    def index
        subscriptions = current_user.subscriptions
        render json: { subscriptions: subscriptions }, status: :ok
    end

    def show
        subscription = find_subscription
        render json: { subscription: subscription }, status: :ok
    end

    def create
        new_subscription = current_user.subscriptions.build(subscription_params)
        new_subscription.save
        render json: { subscription: new_subscription }, status: :created
    end

    def update
        subscription = find_subscription
        subscription.update!(subscription_params)
        render json: { subscription: subscription }, status: :accepted
    end

    def destroy
        subscription = find_subscription
        subscription.destroy
        render json: { message: "Subscription successfully destroyed" }, status: :ok
    end

    private

    def find_subscription
        subscription = Subscription.find_by(id: params[:id])
    end
    
    def subscription_params
        params.permit(:company_id, :status, :frequency, :billing, :pricing, :start_date)
    end

end
