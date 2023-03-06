require "json"
require "open-uri"


class GamesController < ApplicationController

  def new
    random_letters = ('a'..'z').to_a
    @letters = random_letters.shuffle.take(10)
  end

  def score
    @word = (params[:word])
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{@word}")
    json = JSON.parse(response.read)
    @real_word = json["found"]

    if @real_word == true
      @score = "congratulations! #{@word} does exist"
    else
      @score = "sorry but #{@word} does not seem to be a valid word"
    end

  end



end
