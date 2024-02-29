module Pokemons
  class Api
    def self.get(query)
      PokeApi.get(query)
    end
  end

end