require 'discordrb'
require 'json'
require 'yaml'
require 'redd' 

credentials = YAML.load_file('./credentials.yaml')

bot = Discordrb::Bot.new token: credentials['token']
# @session = Redd.it(
#     user_agent: credentials['user_agent'],
#     client_id:  credentials['client_id'],
#     secret:     credentials['secret'], 
#     username:   credentials['username'],
#     password:   credentials['password']
#   )
    
file = File.open("./src/assets/insults.json")
@data = JSON.parse(file.read)

@meme_loop = 1
@dadjoke_loop = 1
@gif_loop = 2
@funny_loop = 1
@til_loop = 1
@tihi_loop = 1
@showerThought_loop = 2

bot.message(start_with: '!insult') do |event|
    username = event.message.to_s.slice(8, 50)
    event.message.delete
    random_insult_key = (rand() * @data.length).to_i
    random_insult = @data.fetch("#{random_insult_key}")
    puts "Insulting #{username.to_s}"
    event.respond "#{username}" "\n" "#{random_insult.to_s}"
end

bot.message(with_text: '!st') do |event|
    event.message.delete
    session = Redd.it(
        user_agent: credentials['user_agent'],
        client_id:  credentials['client_id'],
        secret:     credentials['secret'], 
        username:   credentials['username'],
        password:   credentials['password']
      )
    showerThought_subreddit = session.subreddit('showerthoughts')
    
    if @showerThought_loop == 1
        posts = showerThought_subreddit.hot.first
            elsif @showerThought_loop == 2
                posts = showerThought_subreddit.hot.last
            elsif @showerThought_loop == 3
                posts = showerThought_subreddit.new.first
            elsif @showerThought_loop == 4
                posts = showerThought_subreddit.new.last
            elsif @showerThought_loop == 5
                posts = showerThought_subreddit.top.first
            elsif @showerThought_loop == 6
                posts = showerThought_subreddit.top.last
            elsif @showerThought_loop == 7
                posts = showerThought_subreddit.rising.first
            elsif @showerThought_loop == 8
                posts = showerThought_subreddit.rising.last
            elsif @showerThought_loop == 9
                posts = showerThought_subreddit.controversial.first
            else
                posts = showerThought_subreddit.controversial.last
    end

    puts "Posting Shower Thought " + "#{@showerThought_loop.to_i}"

    @showerThought_loop += 1

    if @showerThought_loop == 11
        @showerThought_loop = @showerThought_loop - 9
    end
     
    event.respond "**""#{posts.title}" "**" "\n"  "#{posts.selftext}"
end

bot.message(with_text: '!meme') do |event|
    event.message.delete
    session = Redd.it(
        user_agent: credentials['user_agent'],
        client_id:  credentials['client_id'],
        secret:     credentials['secret'], 
        username:   credentials['username'],
        password:   credentials['password']
      )
    meme_subreddit = session.subreddit('memes')
    
    if @meme_loop == 1
        posts = meme_subreddit.hot.first
            elsif @meme_loop == 2
                posts = meme_subreddit.hot.last
            elsif @meme_loop == 3
                posts = meme_subreddit.new.first
            elsif @meme_loop == 4
                posts = meme_subreddit.new.last
            elsif @meme_loop == 5
                posts = meme_subreddit.top.first
            elsif @meme_loop == 6
                posts = meme_subreddit.top.last
            elsif @meme_loop == 7
                posts = meme_subreddit.rising.first
            elsif @meme_loop == 8
                posts = meme_subreddit.rising.last
            elsif @meme_loop == 9
                posts = meme_subreddit.controversial.first
            else
                posts = meme_subreddit.controversial.last
    end

    puts "Posting meme " + "#{@meme_loop.to_i}"

    @meme_loop += 1

    if @meme_loop == 11
        @meme_loop = @meme_loop - 10
    end
     
    event.respond "**__""#{posts.title}" "__**" "\n"  "#{posts.url}"
end

bot.message(with_text: '!dadjoke') do |event|
    event.message.delete
    session = Redd.it(
        user_agent: credentials['user_agent'],
        client_id:  credentials['client_id'],
        secret:     credentials['secret'], 
        username:   credentials['username'],
        password:   credentials['password']
      )

    dadjoke_subreddit = session.subreddit('dadjokes')
    if @dadjoke_loop == 1
        posts = dadjoke_subreddit.hot.first
            elsif @dadjoke_loop == 2
                posts = dadjoke_subreddit.hot.last
            elsif @dadjoke_loop == 3
                posts = dadjoke_subreddit.new.first
            elsif @dadjoke_loop == 4
                posts = dadjoke_subreddit.new.last
            elsif @dadjoke_loop == 5
                posts = dadjoke_subreddit.top.first
            elsif @dadjoke_loop == 6
                posts = dadjoke_subreddit.top.last
            elsif @dadjoke_loop == 7
                posts = dadjoke_subreddit.rising.first
            elsif @dadjoke_loop == 8
                posts = dadjoke_subreddit.rising.last
            elsif @dadjoke_loop == 9
                posts = dadjoke_subreddit.controversial.first
            else
                posts = dadjoke_subreddit.controversial.last
    end
    puts "Posting DadJoke " + "#{@dadjoke_loop.to_i}"

    @dadjoke_loop += 1

    if @dadjoke_loop == 11
        @dadjoke_loop = @dadjoke_loop -10
    end
    # puts "#{posts.inspect}"
    event.respond "**__""#{posts.title}" "__**" "\n" "#{posts.selftext}" 

    if posts.selftext == "" && posts.thumbnail != "self"
        event.respond "#{posts.thumbnail}"
        puts "No selftext found, posting thumbnail"
    end

end

bot.message(with_text: '!gif') do |event|
    event.message.delete
    session = Redd.it(
        user_agent: credentials['user_agent'],
        client_id:  credentials['client_id'],
        secret:     credentials['secret'], 
        username:   credentials['username'],
        password:   credentials['password']
      )
    # random_number = rand(1..10).to_i
    gif_subreddit = session.subreddit('gifs')
    
    if @gif_loop == 1
        posts = gif_subreddit.hot.first
            elsif @gif_loop == 2
                posts = gif_subreddit.hot.last
            elsif @gif_loop == 3
                posts = gif_subreddit.new.first
            elsif @gif_loop == 4
                posts = gif_subreddit.new.last
            elsif @gif_loop == 5
                posts = gif_subreddit.top.first
            elsif @gif_loop == 6
                posts = gif_subreddit.top.last
            elsif @gif_loop == 7
                posts = gif_subreddit.rising.first
            elsif @gif_loop == 8
                posts = gif_subreddit.rising.last
            elsif @gif_loop == 9
                posts = gif_subreddit.controversial.first
            else
                posts = gif_subreddit.controversial.last
    end

    puts "Posting gif " + "#{@gif_loop.to_i}"

    @gif_loop += 1

    if @gif_loop == 11
        @gif_loop = @gif_loop - 9
    end
     
    # puts "#{posts.inspect}"
    event.respond"**__""#{posts.title}" "__**" "\n"  "#{posts.url}"
        
end

bot.message(with_text: '!lol') do |event|
    event.message.delete
    session = Redd.it(
        user_agent: credentials['user_agent'],
        client_id:  credentials['client_id'],
        secret:     credentials['secret'], 
        username:   credentials['username'],
        password:   credentials['password']
      )
    random_number = rand(1..10).to_i
    funny_subreddit = session.subreddit('funny')
    
    if @funny_loop == 1
        posts = funny_subreddit.hot.first
            elsif @funny_loop == 2
                posts = funny_subreddit.hot.last
            elsif @funny_loop == 3
                posts = funny_subreddit.new.first
            elsif @funny_loop == 4
                posts = funny_subreddit.new.last
            elsif @funny_loop == 5
                posts = funny_subreddit.top.first
            elsif @funny_loop == 6
                posts = funny_subreddit.top.last
            elsif @funny_loop == 7
                posts = funny_subreddit.rising.first
            elsif @funny_loop == 8
                posts = funny_subreddit.rising.last
            elsif @funny_loop == 9
                posts = funny_subreddit.controversial.first
            else
                posts = funny_subreddit.controversial.last
    end

    puts "Posting funny " + "#{@funny_loop.to_i}"

    @funny_loop += 1

    if @funny_loop == 11
        @funny_loop = @funny_loop - 10
    end
     
    event.respond "**__""#{posts.title}" "__**" "\n"  "#{posts.selftext} #{posts.url}"
end

bot.message(with_text: '!til') do |event|
    event.message.delete
    session = Redd.it(
        user_agent: credentials['user_agent'],
        client_id:  credentials['client_id'],
        secret:     credentials['secret'], 
        username:   credentials['username'],
        password:   credentials['password']
      )
    til_subreddit = session.subreddit('todayilearned')
    
    if @meme_til == 1
        posts = til_subreddit.hot.first
            elsif @til_loop == 2
                posts = til_subreddit.hot.last
            elsif @til_loop == 3
                posts = til_subreddit.new.first
            elsif @til_loop == 4
                posts = til_subreddit.new.last
            elsif @til_loop == 5
                posts = til_subreddit.top.first
            elsif @til_loop == 6
                posts = til_subreddit.top.last
            elsif @til_loop == 7
                posts = til_subreddit.rising.first
            elsif @til_loop == 8
                posts = til_subreddit.rising.last
            elsif @til_loop == 9
                posts = til_subreddit.controversial.first
            else
                posts = til_subreddit.controversial.last
    end

    puts "Posting t.i.l. " + "#{@til_loop.to_i}"

    @til_loop += 1

    if @til_loop == 11
        @til_loop = @til_loop - 10
    end
     
    event.respond "**""#{posts.title}" "**" "\n"  "#{posts.url}"
end

bot.message(with_text: '!tihi') do |event|
    event.message.delete
    session = Redd.it(
        user_agent: credentials['user_agent'],
        client_id:  credentials['client_id'],
        secret:     credentials['secret'], 
        username:   credentials['username'],
        password:   credentials['password']
      )
    meme_subreddit = session.subreddit('tihi')
    
    if @tihi_loop == 1
        posts = meme_subreddit.hot.first
            elsif @tihi_loop == 2
                posts = meme_subreddit.hot.last
            elsif @tihi_loop == 3
                posts = meme_subreddit.new.first
            elsif @tihi_loop == 4
                posts = meme_subreddit.new.last
            elsif @tihi_loop == 5
                posts = meme_subreddit.top.first
            elsif @tihi_loop == 6
                posts = meme_subreddit.top.last
            elsif @tihi_loop == 7
                posts = meme_subreddit.rising.first
            elsif @tihi_loop == 8
                posts = meme_subreddit.rising.last
            elsif @tihi_loop == 9
                posts = meme_subreddit.controversial.first
            else
                posts = meme_subreddit.controversial.last
    end

    puts "Posting TIHI " + "#{@tihi_loop.to_i}"

    @tihi_loop += 1

    if @tihi_loop == 11
        @tihi_loop = @tihi_loop - 10
    end
     
    event.respond "**__""#{posts.title}" "__**" "\n"  "#{posts.url}"
end
bot.run 