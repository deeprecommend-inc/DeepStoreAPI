FROM rust:1.74-slim as builder

WORKDIR /usr/src/

COPY . .

RUN cargo build --release

FROM debian:bookworm-slim

WORKDIR /usr/app

COPY --from=builder /usr/src/config /usr/app/config
COPY --from=builder /usr/src/target/release/deep_store_api-cli /usr/app/deep_store_api-cli

ENTRYPOINT ["/usr/app/deep_store_api-cli"]