FROM ruby
RUN apt update && apt install -y nodejs
RUN git clone --depth=1 https://github.com/fastladder/fastladder /fastladder
WORKDIR /fastladder
RUN bundle -j9
RUN gem install foreman
ENV PORT=5000 RAILS_ENV=production
RUN ./bin/rake assets:precompile
COPY secrets.yml ./config/
COPY crawl_at_once.rb ./script
EXPOSE 5000
CMD foreman start -p $PORT
