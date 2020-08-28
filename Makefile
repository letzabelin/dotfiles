nvim-install:
	mkdir -p ~/.config/nvim
	ln -s $(PWD)/files/nvim/vimrc ~/.config/nvim/init.vim | true
	ln -s $(PWD)/files/nvim/coc-settings.json ~/.config/nvim/coc-settings.json | true

tmux-conf:
	ls -a $(PWD)/files/tmux/tmux.conf ~/.tmux.conf | true
	ls -a $(PWD)/files/tmux/ui.conf ~/.tmux_ui.conf | true

deps-npm:
	npm install -g neovim
	npm install -g prettier eslint babel-eslint eslint-plugin-import eslint-plugin-node
	npx install-peerdeps -g eslint-config-airbnb
	npm install -g stylelint stylelint-config-recommended stylelint-config-standard
	npm i -g livedown
