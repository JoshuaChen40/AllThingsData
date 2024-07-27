# 使用 Ruby 官方映像
FROM ruby:3.1

# 更新並安裝依賴
RUN apt-get update -qq && apt-get install -y nodejs

# 安裝 Jekyll 和 Bundler
RUN gem install jekyll bundler

# 創建一個工作目錄
WORKDIR /site

# 拷貝現有的 Gemfile 和 Gemfile.lock 到工作目錄
COPY Gemfile* /site/

# 安裝 Gemfile 中的所有 gems
RUN bundle install

# 拷貝其他檔案到工作目錄
COPY . /site

# 暴露容器的 4000 端口
EXPOSE 4000

# 啟動 Jekyll 服務
CMD ["bundle", "exec", "jekyll", "serve", "--host=0.0.0.0"]

# docker build -t clean_blog .
# docker run -p 4000:4000 clean_blog
# local Server address: http://localhost:4000/AllThingsDataArchive/