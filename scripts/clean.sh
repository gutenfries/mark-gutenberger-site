# !/bin/bash

source ./scripts/install-deps.sh

if ($install_deps true); then
	{
		printf "\n\e[32mFound required packages...\e[0m\n"
		{
			printf "\n\e[36mRunning jekyll clean... \e[0m\n"
			{
				bundle exec jekyll clean
			}
			printf "\n\e[32mJekyll clean finished... \e[0m\n"
			printf "\n\e[36mCleaning up less css output... \e[0m\n"
			{
				rm -rf -f ./public/css/*
			}
			printf "\n\e[32mCss cleanup finished... \e[0m\n"

			read -p "Clean up log and temp files? (Y/N[default]): " confirm
			if [ "$confirm" = "y" ]; then {
				printf "\n\e[36mCleaning up temp and log files... \e[0m\n"
				rm -rf -f ./logs/*, ./**/*.log, ./logs/*
				printf "\n\e[32mClean complete...\e[0m\n"
			}; else
				{
					printf "\n\e[32mClean complete...\e[0m\n"
				}
			fi
		}
	}
else
	{
		printf "\n\e[31mError: required pakages are not installed.\nPlease run yarn install\e[0m\n"
	}
fi
