FROM ruby:3.1
WORKDIR /app
COPY . .
CMD ["irb"]