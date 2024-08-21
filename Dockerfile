FROM rust:1.76

RUN apt-get update -yqq && apt-get install -yqq cmake g++

WORKDIR /var/www/queue

RUN mkdir src; touch src/main.rs

COPY Cargo.toml Cargo.lock ./

RUN cargo fetch

COPY src/ ./src/

RUN cargo build --release

EXPOSE 80

CMD ./target/release/queue
