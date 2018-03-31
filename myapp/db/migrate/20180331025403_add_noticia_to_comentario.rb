class AddNoticiaToComentario < ActiveRecord::Migration[5.0]
  def change
    add_reference :comentarios, :noticia, foreign_key: true
  end
end
