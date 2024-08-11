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

RUN mkdir -p /var/entry
COPY . /var/entry

RUN gem install rails
RUN chmod +x /var/entry/entrypoint.sh
ENTRYPOINT ["/var/entry/entrypoint.sh"]

RUN mkdir /app
WORKDIR /app
CMD ["rails", "server" ,"-b", "0.0.0.0"]
