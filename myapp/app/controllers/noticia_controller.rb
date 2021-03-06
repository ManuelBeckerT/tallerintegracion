class NoticiaController < ApplicationController
  before_action :set_noticium, only: [:show, :edit, :update, :destroy]

  PER_PAGE_RECORDS = 10
  # GET /noticia
  # GET /noticia.json
  def index
    @noticia = Noticium.order("created_at DESC")
  end

  # GET /noticia/1
  # GET /noticia/1.json
  def show
    
  end

  # GET /noticia/new
  def new
    @noticium = Noticium.new
  end

  # GET /noticia/1/edit
  def edit
  end

  # POST /noticia
  # POST /noticia.json
  def create
    @noticium = Noticium.new(noticium_params)
    @noticium.comentario = 0
    respond_to do |format|
      if @noticium.save
        format.html { redirect_to @noticium, notice: 'Se creó correctamente.' }
        format.json { render :show, status: :created, location: @noticium }
      else
        format.html { render :new }
        format.json { render json: @noticium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /noticia/1
  # PATCH/PUT /noticia/1.json
  def update
    respond_to do |format|
      if @noticium.update(noticium_params)
        format.html { redirect_to @noticium, notice: 'Se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @noticium }
      else
        format.html { render :edit }
        format.json { render json: @noticium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /noticia/1
  # DELETE /noticia/1.json
  def destroy
    @noticium.destroy
    respond_to do |format|
      format.html { redirect_to noticia_url, notice: 'Se eliminó correctamente.' }
      format.json { head :no_content }
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
