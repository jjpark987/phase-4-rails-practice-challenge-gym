class MembershipsController < ApplicationController
    def create
        render json: Membership.create!({
            gym_id: params[:gym_id],
            client_id: params[:client_id],
            charge: params[:charge]
        }), status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    def destroy
        Membership.find(params[:id]).destroy
        head :no_content
    rescue ActiveRecord::RecordNotFound
        render json: { error: 'Membership not found' }, status: :not_found
    end
end
