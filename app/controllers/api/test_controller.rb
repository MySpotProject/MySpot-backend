# frozen_string_literal: true

module Api
  class TestController < ApplicationController
    before_action :authenticate_user!

    def test
      render json: {
        user: 123
      }
    end
  end
end
