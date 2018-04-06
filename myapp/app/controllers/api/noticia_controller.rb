class Api::NoticiaController < ApplicationController
  protect_from_forgery with: :null_session

  respond_to :json

  def index
    @noticia = Noticium.all.order("created_at DESC")
    render json: @noticia
  end

  def index_comments
    @noticium = Noticium.find( params[:id] )
    render json: @noticium.comments
  end

  def create_comments
    @noticium = Noticium.find(params[:id])
    @comment = @noticium.comments.create(params[:name])
    render json: @noticium.comments
  end

  def new
    @noticium = Noticium.new
  end

  def show
    @noticium = Noticium.find( params[:id])
    render json: @noticium
    rescue ActiveRecord::RecordNotFound => e
        render json: { error: "not found" }, status: :not_found
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def noticium_params
      params.require(:noticium).permit(:id, :titulo, :bajada, :contenido, :id_user, :comentario)
    end



end
