class HomeController < ApplicationController
  def index
  	books_data = HTTParty.get("https://skookum-test-api.herokuapp.com/api/v1/books")
  	@books_array = []

  	books_data.each do |data|
  		@books_array.push(data)
  	end

  	@paginatable_array = Kaminari.paginate_array(@books_array).page(params[:page]).per(6)

  end
end
