class Api::NoticiaController < ApplicationController

  def index
    @noticia = Noticium.all.order("created_at DESC")
    render json: @noticia
  end

end
