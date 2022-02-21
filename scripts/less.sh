# !/bin/bash
# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# less.sh (c) 2022
# Desc: compiles all the less to css
# Created: 2022-02-21T01:18:13.903Z
# Modified: 2022-02-21T02:12:52.506Z

source ./scripts/install-deps.sh ? ./install-deps.sh

if ($install_deps true); then
	{
		printf "\n\e[32mFound required packages...\e[0m\n"
		{
			printf "\n\e[36mCompiling less... \e[0m\n"
			{
				yarn lessc ./public/less/main.less >./public/css/main.css
			}
			printf "\n\e[32mLessc Finished... \e[0m\n"
			printf "\n\e[36mUglifying css... \e[0m\n"
			{
				yarn uglifycss ./public/css/main.css >./public/css/main.min.css
			}
			printf "\n\e[32mUglifycss Finished... \e[0m\n"
		}
	}
else
	{
		printf "\n\e[31mError: required pakages are not installed.\nPlease run yarn install\e[0m\n"
	}
fi
