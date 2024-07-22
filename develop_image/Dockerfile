From ruby:3.3.1

<<<<<<< HEAD:Dockerfile
RUN mkdir /app
COPY . /app

RUN gem update && \
  cd app && bundle install
ARG PROJECT_NAME='word_note'
# RUN rails new ${PROJECT_NAME} --api
# RUN bundle install --gemfile /app/${PROJECT_NAME}/Gemfile

=======
>>>>>>> 8c38f5b (tmp):develop_image/Dockerfile
RUN apt update && \
apt install -y sudo curl tar git && \
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz && \
sudo rm -rf /opt/nvim && \
sudo tar -C /opt -xzf nvim-linux64.tar.gz

ENV PATH "$PATH:/opt/nvim-linux64/bin"

<<<<<<< HEAD:Dockerfile
WORKDIR /app/${PROJECT_NAME}
=======
RUN gem install rails

## should replace volta ?
RUN apt install -y nodejs npm && \
npm install -g n && \
n stable 
RUN apt purge -y nodejs npm && apt autoremove -y

RUN npm install -g vite && \
npm install -g tailwindcss

RUN mkdir /app
COPY . /app
WORKDIR /app
>>>>>>> 8c38f5b (tmp):develop_image/Dockerfile

RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]

CMD ["rails", "server" ,"-b", "0.0.0.0"]
