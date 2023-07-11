class ClientsController < ApplicationController
    def show
        render json: Client.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: { error: 'Client not found' }, status: :not_found
    end
end
