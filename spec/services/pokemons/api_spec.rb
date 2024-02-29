require "rails_helper"

RSpec.describe Pokemons::Api, type: :service do

  pokemon_list = [
    OpenStruct.new(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"),
    OpenStruct.new(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/"),
    OpenStruct.new(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon/3/"),
  ]
  mock_response = OpenStruct.new(results: pokemon_list)


  describe ".get" do
    before do
      allow(PokeApi).to receive(:get).with(:pokemon).and_return(mock_response)
    end

    it "calls the PokeApi gem" do
      described_class.get(:pokemon)
      expect(PokeApi).to receive(:get).with(:pokemon)
    end

    it "returns a list of pokemons" do

    end
  end
end
