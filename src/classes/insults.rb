require 'json'



class Insults
    attr_accessor :username

    def initialize
        file = File.open("./src/assets/insults.json")
        @data = JSON.parse(file.read)
    end
    def get_username
        username = event.message.to_s.slice(8, 50)
    end
    def delete_message
        event.message.delete
    end 
    def fetch_random_insult
        random_insult_key = (rand() * @data.length).to_i
        random_insult = @data.fetch("#{random_insult_key}")
        puts "Insulting #{username.to_s}"
        event.respond "#{username}" "\n" "#{random_insult.to_s}"
    end
end

