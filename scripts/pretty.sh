# !/bin/bash

source ./scripts/install-deps.sh

if ($install_deps true); then
	{
		printf "\n\e[32mFound required packages...\e[0m\n"
		{
			printf "\n\e[36mRunning prettier... \e[0m\n"
			{
				yarn prettier --write .
			}
			printf "\n\e[32mPrettier Finished... \e[0m\n"
			printf "\n\e[36mRunning shfmt... \e[0m\n"
			{
				shfmt -w .
			}
			printf "\n\e[32mshfmt Finished... \e[0m\n"
		}
	}
else
	{
		printf "\n\e[31mError: required pakages are not installed.\nPlease run yarn install\e[0m\n"
	}
fi
