class CreateCapturedPokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :captured_pokemons do |t|
      t.string :name
      t.text :note
      t.integer :original_pokemon_id
      t.string :original_name

      t.timestamps
    end
  end
end
