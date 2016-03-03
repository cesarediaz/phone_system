module Api
  module V1
    class PhonesController < ActionController::Base
      respond_to :json

      def get_list
        @cities = {}
        if params[:city_id] && !params[:city_id].empty?
          exist_city_id(params)
        else
          @cities = { error: 'Bad request. Please provide a valid city ID' }
        end

        respond_with @cities
      end

      def order_number
      end

      private

      def exist_city_id(params)
        if City.exists?(params['city_id'])
          @cities = City.find(params['city_id']).phones
        else
          { error: 'This city ID does not exist' }
        end
      end
    end
  end
end
