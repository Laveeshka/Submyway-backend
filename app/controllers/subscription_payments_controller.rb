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
        render json: { message: "Subscription payment was successfully destroyed" }, status: :accepted
    end

    # custom action for creating next_payment
    def create_next_payment
        sub = Subscription.find_by(id: params[:id])
        # find last payment of subscription
        last_payment = sub.subscription_payments.last
        # set paid to true for last payment
        last_payment.update!(paid: true)
        # based on time in seconds, create a payment
        time_in_s = billing_in_s(sub.billing)
        # calculate new payment date
        new_payment_date = last_payment.next_payment_date + time_in_s
        # create payment record
        SubscriptionPayment.create!(subscription: sub, paid: false, next_payment_date: new_payment_date)
        # render that specific subscription
        render json: sub, status: :created
    end

    private

    def billing_in_s(billing)
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

    def find_sub_payment
        sub_payment = SubscriptionPayment.find_by(id: params[:id])
    end

    def subscription_payment_params
        params.permit(:next_payment_date, :paid, :subscription_id)
    end

end
