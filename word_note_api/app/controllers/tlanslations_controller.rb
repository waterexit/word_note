class TlanslationsController < ApplicationController
  before_action :set_tlanslation, only: %i[ show update destroy ]

  # GET /tlanslations
  def index
    @tlanslations = Tlanslation.all

    render json: @tlanslations
  end

  # GET /tlanslations/1
  def show
    render json: @tlanslation
  end

  # POST /tlanslations
  def create
    @tlanslation = Tlanslation.new(tlanslation_params)

    if @tlanslation.save
      render json: @tlanslation, status: :created, location: @tlanslation
    else
      render json: @tlanslation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tlanslations/1
  def update
    if @tlanslation.update(tlanslation_params)
      render json: @tlanslation
    else
      render json: @tlanslation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tlanslations/1
  def destroy
    @tlanslation.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tlanslation
      @tlanslation = Tlanslation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tlanslation_params
      params.require(:tlanslation).permit(:word_id, :japanese)
    end
end
