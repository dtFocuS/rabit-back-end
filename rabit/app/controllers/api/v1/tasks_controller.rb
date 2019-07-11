class Api::V1::TasksController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :update]
    def index
        tasks = Task.all
        #byebug
        render json: TaskSerializer.new(tasks).to_serialized_json
    end

    def create
        @task = Task.new(task_params)
        #byebug
        if @task.save
            #byebug
            render json: { task: TaskSerializer.new(@task).to_serialized_json }, status: :created
        else
            render json: { error: 'failed to create task' }, status: :not_acceptable
        end

    end

    def show
        task = Task.find_by(id: params[:id])
        render json: TaskSerializer.new(task).to_serialized_json
    end

    def update
        task = Task.find_by(id: params[:id])
        if task.update(task_params)
            render json: TaskSerializer.new(task).to_serialized_json
        else
        #
        end
    end

    private
    def task_params
        params.require(:task).permit(:name, :description, :address, :city, :state, :prefer_cost, :zip_code, :completed_by, :user_id)
    end
end
