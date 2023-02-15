class SubscriptionsController < ApplicationController
    def index
        subscriptions = current_user.subscriptions
        render json: subscriptions, each_serializer: SubscriptionSerializer ,status: :ok
    end

    def show
        subscription = find_subscription
        render json: subscription, status: :ok
    end

    def create
        new_subscription = current_user.subscriptions.build(subscription_params)
        new_subscription.save
        new_subscription.subscription_payments.create!(next_payment_date: new_subscription.start_date + time_in_s(new_subscription.billing), paid: false)
        render json: new_subscription, status: :created
    end

    def update
        subscription = find_subscription
        subscription.update!(subscription_params)
        render json: subscription, status: :accepted
    end

    def destroy
        subscription = find_subscription
        subscription.destroy
        render json: { message: "Subscription successfully destroyed" }, status: :ok
    end

    private

    def time_in_s(billing)
        # case function here
        case billing
        when "weekly"
            7 * 24 * 60 * 60
        when "monthly"
            4 * 7 * 24 * 60 * 60
        when "yearly"
            12 * 4 * 7 * 24 * 60 * 60
        end
    end

    def find_subscription
        subscription = Subscription.find_by(id: params[:id])
    end
    
    def subscription_params
        params.permit(:company_id, :status, :frequency, :billing, :pricing, :start_date)
    end

end
