class HomeController < ApplicationController

  include ApplicationHelper

  def index
    #ApplicationHelper
    json_parsing

  	new_array = []

  		if params[:search].nil?
        ### Kaminari pagination GEM
  			@paginatable_array = Kaminari.paginate_array(@books_data).page(params[:page]).per(6)
  		else

      ### FORM Get Request Views/Home/index
	  	  	@books_data.each do |book|
	  	  		if book["title"].include?(params[:search]) || book["year"].to_s.include?(params[:search]) || book["author"].include?(params[:search]) || book["isbn"].to_s.include?(params[:search])
	  	  			new_array << book
	  	  		end
	  		end

	  		@paginatable_array = Kaminari.paginate_array(new_array).page(params[:page]).per(6)			
  		end
  end

  def table_view



      if params[:search].nil?
        json_parsing
      else
          new_array = []
          ### FORM Get Request Views/Home/table_view
          json_parsing

          @books_data.each do |book|
            if book["title"].include?(params[:search]) || book["year"].to_s.include?(params[:search]) || book["author"].include?(params[:search]) || book["isbn"].to_s.include?(params[:search])
              new_array << book
            end
        end

        @books_data = new_array
      end
  end
end
