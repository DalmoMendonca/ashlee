class PagesController < ApplicationController
  def home
  	@flairs = Flair.limit(10).order("RANDOM()")#order("created_at desc")
  end
end
