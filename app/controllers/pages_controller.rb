class PagesController < ApplicationController
  def home
  	@flairs = Flair.order("created_at desc")
  end
end
