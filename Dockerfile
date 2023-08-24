# SPDX-FileCopyrightText: 2023 Diego Elio Pettenò
#
# SPDX-License-Identifier: 0BSD

FROM ubuntu:20.04

WORKDIR /app

COPY . .
RUN apt-get update \
  && apt-get install -y --no-install-recommends docbook-xsl-ns xsltproc sassc make \
  && rm -rf /var/lib/apt/lists/*
ENTRYPOINT [ "make", "all" ]
