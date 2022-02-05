# !/bin/bash

source ./scripts/install-deps.sh

if ($install_deps true); then
	{
		printf "\n\e[32mFound required packages...\e[0m\n"
		{
			printf "\n\e[36mRunning yarn less...\e[0m\n"
			{
				yarn less
			}
			printf "\n\e[32mYarn less finished...\e[0m\n"
			printf "\n\e[36mRunning jekyll dev server...\e[0m\n"
			{
				bundle exec jekyll serve --incremental --watch --trace
			}
		}
	}
else
	{
		printf "\n\e[31mError: required pakages are not installed.\nPlease run yarn install\e[0m\n"
	}
fi
