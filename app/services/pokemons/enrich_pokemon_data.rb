
    # @pokemons = Pokemons::EnrichPokemonData.call(pokemon_list)

module Pokemons
  class EnrichPokemonData

    def initialize(pokemons, current_user)

      @pokemons = pokemons
      @current_user = current_user
    end

    def self.call(pokemons, current_user)
      new(pokemons, current_user).call
    end

    def call
      # map through that and we want to enrivh with captured

      users_captured_pokemon_ids = @current_user.captured_pokemons.pluck(:original_pokemon_id)

      @pokemons.map do |pokemon|
        poke_id = poke_id_from_url(pokemon)

        if users_captured_pokemon_ids.include?(poke_id)
          captured_pokemon = CapturedPokemon.find_by(original_poke_id: poke_id)
        end

        {
          id: captured_pokemon&.id,
          name: captured_pokemon&.name,
          notes: captured_pokemon&.notes,
          original_poke_id: poke_id,
          original_poke_name: pokemon.name,
        }
      end
    end

    private

    def poke_id_from_url(poke)
      poke.url.split("/").last
    end
  end
end