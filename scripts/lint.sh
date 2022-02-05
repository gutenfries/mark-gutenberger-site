# !/bin/bash

source ./scripts/install-deps.sh

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
