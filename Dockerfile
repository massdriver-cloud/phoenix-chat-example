FROM elixir:1.12-alpine
ENV MIX_ENV=prod
ENV SECRET_KEY_BASE=stub

WORKDIR /app

RUN apk add --update openssl ncurses openssh nodejs postgresql-client build-base

COPY mix.exs mix.lock ./

RUN mix local.hex --force && \
  mix local.rebar --force && \
  mix deps.get --only-prod && \
  mix compile

COPY . .

RUN mix assets.deploy

CMD ["/app/entrypoint.sh"]
