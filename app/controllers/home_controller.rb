class HomeController < ApplicationController
  def index
  	books_data = HTTParty.get("https://skookum-test-api.herokuapp.com/api/v1/books")
  	books_data = books_data.parsed_response
  	new_array = []

  		if params[:search].nil?

  			@paginatable_array = Kaminari.paginate_array(books_data).page(params[:page]).per(6)
  		else

	  	  	books_data.each do |book|
	  	  		if book["title"].include?(params[:search]) || book["year"].to_s.include?(params[:search]) || book["author"].include?(params[:search]) || book["isbn"].to_s.include?(params[:search])
	  	  			new_array << book
	  	  		end
	  		end

	  		@paginatable_array = Kaminari.paginate_array(new_array).page(params[:page]).per(6)			
  		end
  end
end
