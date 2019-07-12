class Api::V1::BidsController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, :update]
    def index
        bids = Bid.all
        render json: bids
    end

    def create
        @bid = Bid.new(bid_params)
        #byebug
        if @bid.save
            #byebug
            render json: { bid: BidSerializer.new(@bid) }, status: :created
        else
            render json: { error: 'failed to create bid' }, status: :not_acceptable
        end

    end

    def show
        bid = Bid.find_by(id: params[:id])
        render json: BidSerializer.new(bid)
    end

    def update
        bid = Bid.find_by(id: params[:id])
        if bid.update(bid_params)
            render json: BidSerializer.new(bid)
        else
            puts error.full_message
        end
    end

    def destroy
        bid = Bid.find_by(id: params[:id])
        #byebug
        if bid.destroy
            render json: BidSerializer.new(bid)
        else
            #byebug
            puts error.full_message
        end
    end

    private
    def bid_params
        params.require(:bid).permit(:amount, :eta, :user_id, :task_id)
    end
end
