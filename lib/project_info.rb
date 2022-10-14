# frozen_string_literal: true

require 'http'
require 'yaml'
require 'httparty'
require 'json'
require 'net/http'
require 'uri'


def news_api_path(path)
  "https://newsapi.org/v2/top-headlines?country=tw&apiKey=#{path}"
end

def call_news_url(url)
  full = URI(url)
  res = Net::HTTP.get_response(full)
  JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
end

# print news_json
def hash_to_json(hash_data, dist)
  # Save it!
  temp = hash_data.to_json
  # f_data = File.open(dist, 'w')
  # f_data.write(data)
  # f_data.close

end



def get_full_url(api_url_name = 'News')
  # Added the folder 'config/secrets.yml' first
  config = YAML.safe_load(File.read('config/secrets.yml'))
  key = config['api'][0][api_url_name]
  news_api_path(key)
end


def save_to_yaml(json_file, dist)
  File.open(dist, 'w') do |file|
    file.puts json_file.to_yaml
  end
end


full_url = get_full_url() # 找到含有key的url
news_json = call_news_url(full_url) # Call他拿json轉成hash
save_to_yaml(json_file = news_json,dist = "spec/fixture/results.yml" ) # 先save成yaml (不知道為何)

# puts news_json['status'] == 'ok'
# puts news_json['articles'].length # = 20

# 第0筆資料的欄位是否符合
 

benchmark = ['source','author','title','description','url','urlToImage','publishedAt','content']

# puts news_json['articles'].each_key{ |keys|  keys.any? { |i| benchmark.include? i }  }
check_box = []
news_json['articles'].select{ |article|  check_box<<  article.keys.any? { |i| benchmark.include? i } }
puts check_box.include?(false) == false

# hash_to_json(news_json, 'lib/sample/news.json')

#````````````````````````

# api_response = {}
# api_results = {}

## HAPPY project request

## 以News API url 為例子
# news_url = get_full_url(api_url_name = 'News') # get full News url

# api_response[news_url] =  call_news_url(news_url)
# 將api response 塞到hash value中，對應key為該full_api_url
# We do not need config as parameter cuz we read it automatically from the secret.yaml
# put the {api_url: value_of_api_response}
# api_response 是個Hash



# project = api_response[project_url] 
#project = "https://newsapi.org/v2/top-headlines?country=tw&apiKey=f3c1acee07784d5394185efbe449bba0"

# api_results['size'] = project['size']
# # should be 551

# api_results['owner'] = project['owner']
# # should have info about Soumya

# api_results['git_url'] = project['git_url']
# # should be "git://github.com/soumyaray/YPBT-app.git"

# api_results['contributors_url'] = project['contributors_url']
# # "should be https://api.github.com/repos/soumyaray/YPBT-app/contributors"

# contributors_url = project['contributors_url']
# gh_response[contributors_url] = call_gh_url(config, contributors_url)
# contributors = gh_response[contributors_url].parse

# api_results['contributors'] = contributors
# contributors.count
# # should be 3 contributors array

# contributors.map { |c| c['login'] }
# # should be ["Yuan-Yu", "SOA-KunLin", "luyimin"]

# ## BAD project request
# bad_project_url = gh_api_path('soumyaray/foobar')
# gh_response[bad_project_url] = call_gh_url(config, bad_project_url)
# gh_response[bad_project_url].parse # makes sure any streaming finishes

# File.write('spec/fixtures/github_results.yml', api_results.to_yaml)