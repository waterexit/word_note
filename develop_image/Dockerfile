From ruby:3.3.1

RUN apt update && \
apt install -y sudo curl tar git && \
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz && \
sudo rm -rf /opt/nvim && \
sudo tar -C /opt -xzf nvim-linux64.tar.gz

ENV PATH "$PATH:/opt/nvim-linux64/bin"


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

RUN gem install rails
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]

CMD ["rails", "server" ,"-b", "0.0.0.0"]
