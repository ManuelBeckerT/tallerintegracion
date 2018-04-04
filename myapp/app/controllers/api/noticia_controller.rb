class Api::NoticiaController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :set_noticium, only: [:show, :edit, :update, :destroy]
  respond_to :json

  def index
    @noticia = Noticium.all.order("created_at DESC")
    render json: @noticia
  end

  def new
    @noticium = Noticium.new
  end

  def show
    respond_with Noticium.find( params[:id] )
  end

  def create
    @noticium = Noticium.new(noticium_params)
    @noticium.comentario = 0
    @noticium.id_user = current_user.id
    respond_to do |format|
      if @noticium.save
        format.json { render :show, status: :created, location: @noticium }
      else
        format.json { render json: @noticium.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_noticium
      @noticium = Noticium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def noticium_params
      params.require(:noticium).permit(:id, :titulo, :bajada, :contenido, :id_user, :comentario)
    end

end
