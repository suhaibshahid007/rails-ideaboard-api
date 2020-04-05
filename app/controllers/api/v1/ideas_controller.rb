# frozen_string_literal: true

module Api
  module V1
    class IdeasController < ApplicationController

      def index
        @ideas = Idea.order("created_at DESC")
        render json: @ideas
      end

      def create
        @idea = Idea.create(idea_params)
        render json: @idea
      end

      def update
        @idea = Idea.find(params[:id])
        @idea.update(idea_params)
        render json: @idea
      end

      private

      def idea_params
        params.require(:idea).permit(:title, :body)
      end
    end
  end
end
