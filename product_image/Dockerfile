FROM node:22-alpine as transpile
COPY ./word_note_front/ /build/
WORKDIR /build
RUN npm install -g vite && \
npm install &&\
vite build --mode production && \
mkdir /dist && cp -rf /build/dist / && \
rm -rf /build

FROM ruby:3.3.1

RUN gem install rails

COPY ./word_note_api/ /app/
COPY --from=transpile /dist/ /app/public/
WORKDIR /app
RUN bundle install
RUN rails db:migrate

ENTRYPOINT ["rails", "server" ,"-b", "0.0.0.0"]
