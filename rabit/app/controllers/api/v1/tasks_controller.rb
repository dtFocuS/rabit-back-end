class Api::V1::TasksController < ApplicationController
    def index
        tasks = Task.all
        render json: TaskSerializer.new(tasks).to_serialized_json
    end

    def create
        task = Task.new(task_params)
        if note.save
            render json: NoteSerializer.new(note).to_serialized_json
        else

        end

    end

    def show
        task = Task.find_by(id: params[:id])
        render json: TaskSerializer.new(task).to_serialized_json
    end

    private
    def task_params
        params.require(:task).permit(:name, :description, :address, :city, :state, :prefer_cost, :zip_code, :completed_by)
    end
end
