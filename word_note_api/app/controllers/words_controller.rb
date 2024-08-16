class WordsController < ApplicationController
  before_action :set_word, only: %i[ show update destroy ]
  
  def initialize
    @extractor = WordFromWeb::Weblio::WeblioExtractor.new
  end
  # GET /words
  def index
    @words = Word.includes(:translations)

    render json: @words, include: :translations
  end

  # GET /words/1
  def show
    render json: @word
  end

  # POST /words
  def create
    wordFromWeb = WordFromWeb::ExtractedWordFromWeb.new(word_params[:word], @extractor)
    @word = Word.new(wordFromWeb.get_word_param)
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
      # TODO: unique check
      params.require(:word).permit(:word, :phonetic)
    end
end
