class GamesController < ApplicationController

  def new
    @letters = ('a'..'z').to_a
  end

  def score
  end
end
