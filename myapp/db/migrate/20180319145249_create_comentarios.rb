class CreateComentarios < ActiveRecord::Migration[5.0]
  def change
    create_table :comentarios do |t|
      t.integer :id_user
      t.integer :id_noticia
      t.text :texto
      t.string :titulo

      t.timestamps
    end
  end
end
