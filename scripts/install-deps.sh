#!/bin/bash
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# install-deps.sh (c) 2022
# Desc: checks for dependencies
# Created:  2022-02-21T00:48:45.407Z
# Modified: 2022-02-21T01:08:11.185Z

# declare -g install_deps=false

# # CHECK SCRIPTS:

# function check-node() {
# 	printf "\n\e[36mCheking for node...\e[0m\n"
# 	# ugly as hell, but this is the best nullish coalescing native bash can do..
# 	node_dir="{./node_modules/:-{../node_modules/:-default}}"
# 	if [ -d ${node_dir} ]; then
# 		{
# 			printf "\n\e[32mFound node...\e[0m\n"
# 			check_node=true
# 		}
# 	else
# 		{
# 			printf "\n\e[31mError: Node not found...\e[0m\n"
# 			check_node=false
# 		}
# 	fi

# }

# function check-ruby() {
# 	echo "\n\e[36mChecking for ruby...\e[0m\n"
# 	bin_dir="/bin/ruby"
# 	if [ -d ${bin_dir} ]; then
# 		{
# 			printf "\n\e[32mFound ruby...\e[0m\n"
# 			check_ruby=true
# 		}
# 	else
# 		{
# 			printf "\n\e[31mError: ruby not found...\e[0m\n"
# 			check_ruby=false
# 		}

# 	fi
# }

# INSTALL SCRIPTS:

function install-yarn-env() {
	# printf "\n\e[36mUpdating npm...\e[0m\n"
	# {
	# 	npm install -g npm
	# }
	printf "\n\e[36mChecking for yarn...\e[0m\n"
	{
		yarn --version
	}
	if [ $? -eq 0 ]; then
		{
			printf "\n\e[32mFound yarn...\e[0m\n"
			yarn_env=true
		}
	else
		{
			printf "\n\e[31mYarn not found...\e[0m\n"
			printf "\n\e[36mInstalling yarn...\e[0m\n"
			{
				npm install -g yarn
			}
			if [ -d ${node_dir} ]; then
				{
					printf "\n\e[32mResolved node enviroment...\e[0m\n"
					yarn_env=true
				}
			else
				{
					printf "\n\e[31mError: could not resolve node enviroment. \nPlease contact sys admin and/or attempt to install node\e[0m\n"
					yarn_env=false
				}
			fi
		}
	fi

}

function install-bundle-env() {
	printf "\n\e[36mChecking for bundle\e[0m\n"
	{
		bundle --version
	}
	if [ $? -eq 0 ]; then
		{
			printf "\n\e[32mFound bundle...\e[0m\n"
			bundle_env=true
		}
	else
		{
			printf "\n\e[31mBundle not found...\e[0m\n"
			printf "\n\e[36mInstalling bundle...\e[0m\n"
			{
				gem install bundler
			}
			printf "\n\e[32mBundle installed successfully...\e[0m\n"
		}
	fi
}

# INSTALL DEP SCRIPTS:

# function install-node-deps() {
# 	printf "\n\e[36mRunning yarn... \e[0m\n"
# 	{
# 		yarn
# 	}
# 	printf "\n\e[32mYarn Finished... \e[0m\n"
# }

function install-ruby-deps() {
	printf "\n\e[36mRunning bundle... \e[0m\n"
	{
		bundle install
	}
	printf "\n\e[32mBundle Finished... \e[0m\n"
}

function install-shfmt() {
	printf "\n\e[36mInstalling shfmt... \e[0m\n"
	{
		curl -sS 'https://webinstall.dev/shfmt' | bash

	}
	printf "\n\e[32mshfmt installed successfully... \e[0m\n"

}

# # MAIN
# function check-env() {
# 	printf "\n\e[36mChecking env... \e[0m\n"
# 	{
# 		check-node
# 		if ($check_node true); then
# 			{
# 				printf "\n\e[32mNode found...\e[0m\n"
# 				check-ruby
# 				if ($check_ruby true); then
# 					{
# 						printf "\n\e[32mRuby found...\e[0m\n"
# 						check_env=true
# 					}
# 				else
# 					{
# 						printf "\n\e[31mError: Ruby not found...\e[0m\n"
# 						check_env=false
# 						install-bundle-env
# 					}
# 				fi
# 			}
# 		else
# 			{
# 				printf "\n\e[31mError: Node not found...\e[0m\n"
# 				install-yarn-env
# 				check_env=false

# 			}
# 		fi
# 	}
# }

function install-deps-main-func() {
	if ($check_env true); then
		{
			printf "\n\e[36mInstalling dependencies...\e[0m\n"
			# install-node-deps
			install-ruby-deps
			install-shfmt
			printf "\n\e[32mAll dependencies installed successfully...\e[0m\n"
			printf "\n\e[1;35mScript complete...\e[0m\n"
			declare -g install_deps=true
			# exit 0
		}
	else
		{
			printf "\n\e[31mWell shit. If you see this error message,\nyou're going to have to debug this script file and possibly others.\n$root/scripts/install-deps.sh\e[0m\n"
		}
	fi
}
install-deps-main-func
