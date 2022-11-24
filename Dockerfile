# jekyll 3 for gh-pages
FROM ruby:2.7.4-slim

ARG USER_ID=${USER_ID}
ARG GROUP_ID=${GROUP_ID}
ARG USER_NAME=${USER_NAME}
ARG GROUP_NAME=${GROUP_NAME}
ARG HOME=/home/${USER_NAME}
ENV HOME=/home/${USER_NAME}

RUN apt-get update -qq && apt-get install -y build-essential=12.9 --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--source", "/jekyll"]
EXPOSE 4000

RUN groupadd -g ${GROUP_ID} ${GROUP_NAME} \
  && useradd -l -m ${USER_NAME} -u ${USER_ID} -g ${GROUP_NAME} -s /bin/bash

USER ${USER_NAME}
# overwritten by bind mount. temp directory for install.
WORKDIR ${HOME}/jekyll
COPY --chown=${USER_NAME}:${GROUP_NAME} docs/Gemfile* ${HOME}
RUN bundle install
WORKDIR ${HOME}

