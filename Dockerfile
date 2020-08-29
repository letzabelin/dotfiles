FROM alpine:latest

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories
RUN apk update && apk upgrade

RUN apk add --no-cache build-base \
    git \
    curl \
    wget \
    bash \
    libxml2-dev \
    libxslt-dev \
    libgcrypt-dev \
    libffi \
    openssl-dev \
    libffi-dev \
    python3 \
    py-pip \
    python2-dev \
    python3-dev \
    inotify-tools \
    neovim \
    tidyhtml \
    the_silver_searcher \

WORKDIR ~/.asdf
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf \
      && git checkout "$(git describe --abbrev=0 --tags)" \

RUN asdf plugin-add nodejs \
      && bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring' \
      && asdf install nodejs 14.4.0 \
      && asdf global nodejs 14.4.0 \

RUN asdf plugin-add ruby \
      && asdf install ruby 2.7.1 \
      && asdf global ruby 2.7.1 \

RUN npm config set unsafe-perm true
RUN npm install -g typescript vale
RUN npm install -g eslint babel-eslint \
      eslint-config-airbnb eslint-plugin-jest eslint-plugin-flowtype \
      eslint-plugin-babel eslint-plugin-import eslint-plugin-lodash-fp \
      eslint-plugin-jsx-a11y eslint-plugin-react eslint-config-airbnb-base
RUN npm install -g yaml-language-server typings pug-lint js-yaml js-beautify jsonlint neovim
RUN npm install -g stylelint stylelint-config-recommended

RUN gem install pkg-config solargraph --no-document -- --use-system-libraries
RUN solargraph download-core
RUN gem install rubocop rubocop-rspec rubocop-performance --no-document
RUN gem install haml-lint slim_lint rake neovim --no-document

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf \
      && ~/.fzf/install --key-bindings --update-rc --completion \
      && cp /root/.fzf/bin/fzf /usr/local/bin

RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COPY files/nvim/init.vim /root/.config/nvim/init.vim

ENV PATH $HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH

COPY entrypoint.sh /usr/local/bin/

RUN nvim -i NONE -c PlugInstall -c quitall

ENV FZF_DEFAULT_COMMAND 'ag -g ""'
ENV WORKSPACE /app

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
