class WordFromWeb::ExtractedWordFromWeb
  def initialize(word, extractor)
    @word = word
    @tranlslations = extractor.get_translations word
    @phonetic = extractor.get_phonetic word
  end
  
  def get_word_param
     # FIX ME
     {word: @word, phonetic: @phonetic, translations_attributes: [{japanese: @tranlslations[0]}] }
  end

end
