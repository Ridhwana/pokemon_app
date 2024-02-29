class PokemonsController < ApplicationController
  def index

    begin
      pokemon_list = Pokemons::Api.get(:pokemon)
      ap current_user
      binding.pry
      @pokemons = Pokemons::EnrichPokemonData.call(pokemon_list, current_user)
    rescue StandardError => e
      # flash[:error] = "There was an error fetching the pokemon data: #{e.message}"
      # redirect_to pokemon_path
    end

    # get the pokemon data from the POkeApi
    # @pokemons = Pokemons::EnrichPokemonData.call(pokemon_list)
    # enrich the pokemon data and return it to the view
  end
end
