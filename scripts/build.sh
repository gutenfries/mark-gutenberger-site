# !/bin/bash
# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# build.sh (c) 2022
# Desc: main build script
# Created: 2022-02-21T01:18:13.903Z
# Modified: 2022-02-21T02:14:39.889Z

source ./scripts/install-deps.sh ? ./install-deps.sh

if ($install_deps true); then
	{
		printf "\n\e[32mFound required packages...\e[0m\n"
		{
			printf "\n\e[36mRunning yarn "less" command... \e[0m\n"
			{
				yarn less
			}
			printf "\n\e[32mYarn "less" finished... \e[0m\n"

			printf "\n\e[34m-------------------------------------------------\e[0m\n"

			printf "\n\e[36mBuilding jekyll [skip run]...\e[0m\n"
			{
				bundle exec jekyll build --no-watch --trace
			}
			printf "\n\e[32mJekyll build finished... \e[0m\n"
		}
	}
else
	{
		printf "\n\e[31mError: required pakages are not installed.\nPlease run yarn install\e[0m\n"
	}
fi
