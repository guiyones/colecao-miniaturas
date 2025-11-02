class MiniaturasController < ApplicationController
  before_action :set_miniatura, only: %i[ show edit update destroy ]

  # GET /miniaturas or /miniaturas.json
  def index
    sort_column = params[:sort] || "marca_carro"
    sort_direction = params[:direction] || "asc"
    @miniaturas = Miniatura.order("#{sort_column} #{sort_direction}")

    @miniaturas = Miniatura.por_marca_carro(params[:marca_carro])
    @marcas_carro = Miniatura.distinct.pluck(:marca_carro).compact.sort
  end

  # GET /miniaturas/1 or /miniaturas/1.json
  def show
  end

  # GET /miniaturas/new
  def new
    @miniatura = Miniatura.new
  end

  # GET /miniaturas/1/edit
  def edit
  end

  # POST /miniaturas or /miniaturas.json
  def create
    @miniatura = Miniatura.new(miniatura_params)

    respond_to do |format|
      if @miniatura.save
        format.html { redirect_to @miniatura, notice: "Miniatura was successfully created." }
        format.json { render :show, status: :created, location: @miniatura }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @miniatura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /miniaturas/1 or /miniaturas/1.json
  def update
    respond_to do |format|
      if @miniatura.update(miniatura_params)
        format.html { redirect_to @miniatura, notice: "Miniatura was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @miniatura }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @miniatura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /miniaturas/1 or /miniaturas/1.json
  def destroy
    @miniatura.destroy!

    respond_to do |format|
      format.html { redirect_to miniaturas_path, notice: "Miniatura was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_miniatura
      @miniatura = Miniatura.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def miniatura_params
      params.expect(miniatura: [ :descricao, :colecao, :linha, :marca_carro, :marca_mini, :ano ])
    end
end
