require 'sinatra/base'
require 'redis'
require 'yaml'

module HashHelper
	CHARS = %w(
		0 1 2 3 4 5 6 7 8 9	A B C D E F G H I J	K L M N O P Q R S T	U
		V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z
	)
	def encode(i)
		tmp = ''
		while(i>0)
			tmp = CHARS[i % CHARS.length] + tmp;
			i/=CHARS.length
		end
		tmp
	end
	def decode(s)
		# unimplements
	end
end

module Config
	def self.all
		@all = YAML.load_file './config.yaml' if @all.nil?
		@all
	end
	def self.method_missing(name,*args,&block)
		self.all[name.id2name]
	end
end

module DBHelper
	include HashHelper
	
	@@connection = Redis.new Config.redis_config
	@@counter = :'~COUNT'
	def put_url(url)
		s = encode(@@connection.incr @@counter)
		@@connection.set s,url
		s
	end
	
	def get_url(hash)
		@@connection.get hash
	end
end
		

class App < Sinatra::Base
	include DBHelper
	
	configure do
		set :public_folder, File.dirname(__FILE__) + '/public'
		disable :show_exceptions
	end
	
	get '/' do
		erb :index, locals: { result: nil }
	end
	
	get '/:hash' do |hash|
		begin
			url = get_url hash
			if url
				redirect url,302
			else
				erb :'404'
			end
		rescue => e
			erb :error, locals: { error: e.message }
		end
	end
	
	post '/' do
		url = params[:url].to_s
		begin
			raise '网址过长' if url.length > 8192
			raise '网址格式错误' unless /^\w+:\/\/.+/ =~ url
			erb :index, locals: { result: Config.url_prefix + put_url(url) }
		rescue => e
			erb :error, locals: { error: e.message }
		end
	end
	
end