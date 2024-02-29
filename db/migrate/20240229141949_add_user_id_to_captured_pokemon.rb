class AddUserIdToCapturedPokemon < ActiveRecord::Migration[7.1]
  def change
    add_reference :captured_pokemons, :user, null: false, foreign_key: true
  end
end
