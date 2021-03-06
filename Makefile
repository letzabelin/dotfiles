nvim-install:
	mkdir -p ~/.config/nvim
	cp -r $(PWD)/home/.config/nvim/lua ~/.config/nvim | true
	cp -r $(PWD)/home/.config/nvim/snippets ~/.config/nvim | true
	cp $(PWD)/home/.config/nvim/init.lua ~/.config/nvim/init.lua | true

tmux-conf:
	cp $(PWD)/files/tmux/tmux.conf ~/.tmux.conf | true
	cp $(PWD)/files/tmux/ui.conf ~/.tmux_ui.conf | true
	cp $(PWD)/files/tmux/ui.conf ~/.tmux_settings.conf | true
	cp $(PWD)/files/tmux/ui.conf ~/.tmux_plugins.conf | true

kitty-conf:
	cp -r $(PWD)/home/.config/kitty ~/.config

deps-npm:
	npm i -g neovim
	npm i -g npm-check-updates
	npm i -g prettier eslint eslint_d babel-eslint eslint-plugin-import eslint-plugin-node
	npm i -g eslint-config-airbnb
	npm i -g eslint-config-recommended
	npm i -g eslint-config-airbnb-bundle
	npm i -g stylelint stylelint-config-recommended stylelint-config-standard
	npm i -g livedown
	npm i -g lua-fmt
	npm i -g typescript typescript-language-server
	npm i -g bash-language-server
	npm i -g vscode-json-languageserver
	npm i -g yaml-language-server
	npm i -g vscode-css-languageserver-bin

deps-gem:
	gem install solargraph rubocop neovim
	gem install rubocop-rspec rubocop-rails rubocop-performance
