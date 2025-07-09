module Api
  class PokemonController < ApplicationController
    def index
      name = params[:name]
      return render json: { error: 'name parameter is required' }, status: :bad_request unless name

      result = PokeService.new(name).fetch_data

      if result.success?
        render json: {
          name: result["name"],
          height: result["height"],
          weight: result["weight"],
          base_experience: result["base_experience"],
          types: result["types"].map { |t| t["type"]["name"] }
        }
      else
        render json: { error: "Pokemon not found" }, status: :not_found
      end
    end
  end
end
