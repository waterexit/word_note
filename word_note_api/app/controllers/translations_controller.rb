class TranslationsController < ApplicationController
  before_action :set_translation, only: %i[ show update destroy ]

  # GET /translations
  def index
    @translations = Translation.all

    render json: @translations
  end

  # GET /translations/1
  def show
    render json: @translation
  end

  # POST /translations
  def create
    @translation = Translation.new(translation_params)

    if @translation.save
      render json: @translation, status: :created, location: @translation
    else
      render json: @translation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /translations/1
  def update
    if @translation.update(translation_params)
      render json: @translation
    else
      render json: @translation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /translations/1
  def destroy
    @translation.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_translation
      @translation = Translation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def translation_params
      params.require(:translation).permit(:word_id, :japanese)
    end
end
