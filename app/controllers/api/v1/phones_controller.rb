module Api
  module V1
    class PhonesController < ActionController::Base
      respond_to :json

      def get_list
        respond_with cities(params)
      end

      def order_number
        phone = Phone.find_by(number: params['number'])
        respond_with exist_phone?(phone)
      end

      private

      def exist_phone?(phone)
        if !phone.nil?
          { terms: terms, status: 'success', message: 'phone number exist' }
        else
          { terms: '', status: 'failure', message: 'phone number does not exist' }
        end
      end

      def exist_city?(params)
        if City.exists?(params['city_id'])
          @cities = City.find(params['city_id']).phones
        else
          { status: 'failure', error: 'This city ID does not exist' }
        end
      end

      def city_id_valid?(params)
        /^\d+$/ === params
      end

      def cities(params)
        if params[:city_id] && !city_id_valid?(params[:city_id])
          { status: 'failure', error: 'Bad request. Please provide a valid city ID' }
        elsif params[:city_id] && !params[:city_id].empty?
          exist_city?(params)
        end
      end

      def terms
        'Lorem ipsum dolor sit amet, consectetur adipiscing
        elit, sed do eiusmod tempor incididunt ut labore et dolore magna
        aliqua. Ut enim ad ...'
      end
    end
  end
end
