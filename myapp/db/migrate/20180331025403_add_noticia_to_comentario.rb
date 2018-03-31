class AddNoticiaToComentario < ActiveRecord::Migration[5.0]
  def change
    add_reference :comentarios, :noticia, :id,  foreign_key: true
  end
end
