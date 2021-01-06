nvim-install:
	mkdir -p ~/.config/nvim
	cp $(PWD)/home/.config/nvim/lua ~/.config/nvim | true
	cp $(PWD)/home/.config/nvim/snippets ~/.config/nvim | true
	ln -s $(PWD)/home/.config/nvim/init.lua ~/.config/nvim/init.lua | true

tmux-conf:
	ls -a $(PWD)/files/tmux/tmux.conf ~/.tmux.conf | true
	ls -a $(PWD)/files/tmux/ui.conf ~/.tmux_ui.conf | true
	ls -a $(PWD)/files/tmux/ui.conf ~/.tmux_settings.conf | true
	ls -a $(PWD)/files/tmux/ui.conf ~/.tmux_plugins.conf | true

deps-npm:
	npm i -g neovim
	npm i -g prettier eslint babel-eslint eslint-plugin-import eslint-plugin-node
	npx install-peerdeps -g eslint-config-airbnb
	npm i -g stylelint stylelint-config-recommended stylelint-config-standard
	npm i -g livedown
	npm i -g lua-fmt
	npm i -g typescript typescript-language-server
	npm i -g bash-language-server
	npm i -g vscode-json-languageserver
	npm i -g vscode-css-languageserver-bin

deps-gem:
	gem install solargraph rubocop neovim
	gem install rubocop-rspec rubocop-rails rubocop-performance
