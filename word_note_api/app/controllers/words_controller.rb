class WordsController < ApplicationController
  before_action :set_word, only: %i[ show update destroy ]

  # GET /words
  def index
    @words = Word.includes(tlanslation: [:example])

    render json: @words, include: {tlanslation: {include: :example}}
  end

  # GET /words/1
  def show
    render json: @word
  end

  # POST /words
  def create
    @word = Word.new(word_params)

    if @word.save
      render json: @word, status: :created, location: @word
    else
      render json: @word.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /words/1
  def update
    if @word.update(word_params)
      render json: @word
    else
      render json: @word.errors, status: :unprocessable_entity
    end
  end

  # DELETE /words/1
  def destroy
    @word.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def word_params
      params.require(:word).permit(:word, :phonetic)
    end
end
