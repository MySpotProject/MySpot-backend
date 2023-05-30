# frozen_string_literal: true

module Api
    class ApplicationController < ApplicationController
        before_action :def_auth

        private

        def def_auth
            if Rails.env.development? && ENV["AUTO_AUTH"]
                current_user ||= User.first
            end
        end
    end
end
