# !/bin/bash
# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# lint.sh (c) 2022
# Desc: runs the project linting
# Created: 2022-02-21T01:18:13.903Z
# Modified: 2022-02-21T02:13:13.946Z

source ./scripts/install-deps.sh ? ./install-deps.sh

if ($install_deps true); then
	{
		printf "\n\e[32mFound required packages...\e[0m\n"
		{
			printf "\n\e[36mRunning eslint... \e[0m\n"
			{
				yarn eslint .
			}
			printf "\n\e[32mEslint Finished... \e[0m\n"
		}
	}
else
	{
		printf "\n\e[31mError: required pakages are not installed.\nPlease run yarn install\e[0m\n"
	}
fi
