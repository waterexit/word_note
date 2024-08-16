# openがprivateだから明示的にrequireが必要？
require 'open-uri' 
class WordFromWeb::Weblio::WeblioExtractor
  WeblioUri = 'https://ejje.weblio.jp/content/'
  
  def initialize
    @nodeListMap = {}
  end

  def get_translations(word)
    [ get_node(word).css('.content-explanation.ej').text.strip ]
  end
  
  def get_phonetic(word)
    get_node(word).css('.phoneticEjjeWrp').text.strip
  end

  private
    def fetch_node(word)
      return Nokogiri::HTML.parse(URI.open(WeblioUri + word))
    end

    def get_node(word)
      @nodeListMap[word] ||= fetch_node(word)
    end
end
