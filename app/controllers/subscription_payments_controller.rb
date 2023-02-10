class SubscriptionPaymentsController < ApplicationController
    
    # get all the subscription payments for the current user
    def index
        sub_payments = current_user.subscription_payments
        render json: { subscription_payments: sub_payments }, status: :ok
    end

    # get one specific subscription payment
    def show
        sub_payment = find_sub_payment
        render json: { subscription_payment: sub_payment }, status: :ok
    end

    # create a new subscription payment
    def create
        new_sub_payment = SubscriptionPayment.create!(subscription_params)
        render json: { subscription_payment: new_sub_payment }, status: :created
    end

    # update a subscription payment
    def update
        sub_payment = find_sub_payment
        sub_payment.update!(subscription_payment_params)
        render json: { sub_payment: sub_payment }, status: :accepted
    end

    # destroy a subscription payment
    def destroy
        sub_payment = find_sub_payment
        sub_payment.destroy
        render json { message: "Subscription payment was successfully destroyed" }, status: :accepted
    end

    private

    def find_sub_payment
        sub_payment = SubscriptionPayment.find_by(id: params[:id])
    end

    def subscription_payment_params
        params.permit(:next_payment_date, :paid, :subscription_id)
    end

end
