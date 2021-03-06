# !/bin/bash
# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# dev.sh (c) 2022
# Desc: runs the devlopment server
# Created: 2022-02-21T01:18:13.903Z
# Modified: 2022-02-21T02:11:21.891Z

source ./scripts/install-deps.sh ? ./install-deps.sh

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
