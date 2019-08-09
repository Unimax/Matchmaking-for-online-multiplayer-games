FROM open-match-base-build as builder

WORKDIR /go/src/open-match.dev/open-match/examples/functions/golang/deathmatch
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o matchfunction .

FROM gcr.io/distroless/static:nonroot
WORKDIR /app/
COPY --from=builder --chown=nonroot /go/src/open-match.dev/open-match/examples/functions/golang/deathmatch/matchfunction /app/

ENTRYPOINT ["/app/matchfunction"]
