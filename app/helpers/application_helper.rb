module ApplicationHelper

	def json_parsing
		@books_data = HTTParty.get("https://skookum-test-api.herokuapp.com/api/v1/books")
		@books_data = @books_data.parsed_response 
	end

end
