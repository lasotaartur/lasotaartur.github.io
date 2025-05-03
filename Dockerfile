# Use the official Jekyll image from Docker Hub
FROM jekyll/jekyll:latest

# Set the working directory inside the container
WORKDIR /srv/jekyll

# Install
RUN gem install webrick jekyll bundler

# Build the site and make it available on a local server
CMD ["jekyll", "serve", "--watch", "--force_polling", "--host", "0.0.0.0"]