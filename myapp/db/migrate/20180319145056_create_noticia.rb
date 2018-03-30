class CreateNoticia < ActiveRecord::Migration[5.0]
  def change
    create_table :noticia do |t|
      t.string :titulo
      t.string :bajada
      t.text :contenido
      t.integer :id_user
      t.integer :comentario

      t.timestamps
    end
  end
end
