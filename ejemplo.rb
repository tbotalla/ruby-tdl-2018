require 'faraday'

# TODO! terminar
class PasswordCracker
	def initialize(api)
		@api = api
	end

	def crack!()	
		@api.include?('test2')
		return
	end
end	

class Api
	URL = 'http://www.lettermelater.com/account.php?'
	COOKIE = 'ZP_CAL=%27fdow%27%3Anull%2C%27history%27%3A%222018/10/10/00/03%22%2C%27sortOrder%27%3A%22asc%22%2C%27hsize%27%3A9; code=5889d31b89e98f1147f6009c6e0f077e; user_id=304113; __atuvc=31%7C41; __atuvs=5bbd6b6bfbe92937019'
	

	def self.include?(query) 
		puts get(query).body.include?("test2")
	end

	def self.get(query)
		Faraday.get(URL, {qe: query}, Cookie: COOKIE)
	end
end

puts PasswordCracker.new(Api).crack!()