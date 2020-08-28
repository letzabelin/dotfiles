nvim-install:
	mkdir -p ~/.config/nvim
	ln -s $(PWD)/files/vimrc ~/.config/nvim/init.vim | true
	ln -s $(PWD)/files/coc-settings.json ~/.config/nvim/coc-settings.json | true

tmux-conf:
	ls -a $(PWD)/files/tmux.conf ~/.tmux.conf | true

deps-npm:
	npm install -g neovim
	npm install -g prettier eslint babel-eslint eslint-plugin-import eslint-plugin-node
	npx install-peerdeps -g eslint-config-airbnb
	npm install -g stylelint stylelint-config-recommended stylelint-config-standard
	npm i -g livedown
