#!/bin/bash
# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# check-deps.sh (c) 2022
# Desc: dependency check script
# Created: 2022-02-21T01:18:13.903Z
# Modified: 2022-02-21T02:10:13.860Z

declare -g install_deps=false

function verbose {
	printf "Error: function \'verbose()\' not configured.\n"
}

# CHECK SCRIPTS:

function check-node() {
	printf "\n\e[36mCheking for node...\e[0m\n"
	# ugly as hell, but this is the best nullish coalescing native bash can do..
	node_dir="{./node_modules/:-{../node_modules/:-default}}"
	if [ -d ${node_dir} ]; then
		{
			printf "\n\e[32mFound node...\e[0m\n"
			check_node=true
		}
	else
		{
			printf "\n\e[31mError: Node not found...\e[0m\n"
			check_node=false
		}
	fi
}

function check-ruby() {
	echo "\n\e[36mChecking for ruby...\e[0m\n"
	bin_dir="/bin/ruby"
	if [ -d ${bin_dir} ]; then
		{
			printf "\n\e[32mFound ruby...\e[0m\n"
			check_ruby=true
		}
	else
		{
			printf "\n\e[31mError: ruby not found...\e[0m\n"
			check_ruby=false
		}

	fi
}

# MAIN
function check-env() {
	printf "\n\e[36mChecking env... \e[0m\n"
	{
		check-node
		if ($check_node true); then
			{
				printf "\n\e[32mNode found...\e[0m\n"
				check-ruby
				if ($check_ruby true); then
					{
						printf ":)"
					}
				fi
			}
		else
			{
				printf "\n\e[31mError: Node not found...\e[0m\n"
				install-yarn-env
				check_env=false

			}
		fi
	}
}

verbose
