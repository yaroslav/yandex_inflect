$KCODE = 'u'

$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'httparty'

module YandexInflect
  # Число доступных вариантов склонений
  INFLECTIONS_COUNT = 6
  
  # Класс для получения данных с веб-сервиса Яндекса.
  class Inflection
    include HTTParty
    base_uri 'http://export.yandex.ru/'

    # Получить склонения для имени <tt>name</tt>
    def get(name)
      options = {}
      options[:query] = { :name => name }
      inflections = self.class.get("/inflect.xml", options)
      
      return inflections["inflections"]["inflection"]
    end
  end
  
  # Возвращает массив склонений (размером <tt>INFLECTIONS_COUNT</tt>) для слова <tt>word</tt>.
  #
  # Если слово не найдено в словаре, будет возвращен массив размерностью <tt>INFLECTIONS_COUNT</tt>,
  # заполненный этим словом.
  def self.inflections(word)
    inflections = []
    
    # Забиваем варианты склонений оригиналом если поднято исключение
    get = Inflection.new.get(word) rescue word
    
    if get.is_a?(Array)
      # Если Яндекс вернул массив склонений
      inflections = get
    elsif get.is_a?(String)
      # Если Яндекс не вернул массива склонений (слово не найдено в словаре),
      # а только строку, то забиваем этой строкой весь массив 
      inflections.fill(get, 0..INFLECTIONS_COUNT-1)
    else
      # Забиваем варианты склонений оригиналом
      inflections.fill(word, 0..INFLECTIONS_COUNT-1)
    end
    
    inflections
  end
end