FROM alpine:3.14
EXPOSE 443 80
RUN apk update
RUN apk add nginx openrc vim
CMD ["nginx", "-g", "daemon off;"]
