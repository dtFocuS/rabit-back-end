class Api::V1::BidsController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]
    def index
        bids = Bid.all
        render json: bids
    end

    def create
        @bid = Bid.new(bid_params)
        #byebug
        if @bid.save
            #byebug
            render json: { task: BidSerializer.new(@bid) }, status: :created
        else
            render json: { error: 'failed to create bid' }, status: :not_acceptable
        end

    end

    def show
        bid = Bid.find_by(id: params[:id])
        render json: BidSerializer.new(bid)
    end

    private
    def task_params
        params.require(:bid).permit(:amount, :eta, :user_id, :task_id)
    end
end
