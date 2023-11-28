#!/bin/bash
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
reset=`tput sgr0`

# Set current directory.
cur_dir=$(pwd)

# =======================================================
# Install plugin.
# =======================================================

# Begin.
printf "\n [$(TZ=America/Detroit date +'%x %X %Z')] >>>> 🚀 Installing Built Mighty Login plugin... \n\n";

# Check if plugin exists.
if [ -d "$cur_dir/wp-content/mu-plugins/builtmighty-login.php" ]; then
    # Confirmation.
    echo "[$(TZ=America/Detroit date +'%x %X %Z')] >>>> ${green}✅ Plugin already installed!${reset}"
else
    # Install plugin.
    curl -s https://raw.githubusercontent.com/builtmighty/builtmighty-login/main/builtmighty-login.php > $cur_dir/wp-content/mu-plugins/builtmighty-login.php
    echo "[$(TZ=America/Detroit date +'%x %X %Z')] >>>> ${green}✅ Plugin installed!${reset}"
fi

# Ask if we want to enable a custom endpoint.
while true; do
	read -p "${green}✅ Enable custom login URL?${reset} (y/n)" yn
	case $yn in
		[Yy]* )
            # What should the endpoint be?
            read -p "🏷️ What is the endpoint URL? (ex. siteurl.com/ENDPOINT): " endpoint_url
            # Confirmation.
            echo "✨ Endpoint URL set to: ${green}${endpoint_url}${reset}"
            # Check if BML_ENDPOINT already exists.
            if grep -q "BML_ENDPOINT" $cur_dir/wp-config.php; then
                # Confirmation.
                echo "[$(TZ=America/Detroit date +'%x %X %Z')] >>>> ${green}⚡️ BML_ENDPOINT already set!${reset}"
            else
                # Add BML_ENDPOINT to wp-config.php after $table_prefix = 'wp_';.
                sed -i "/$table_prefix = 'wp_';/a # Built Mighty Login\ndefine( 'BML_ENDPOINT', '${endpoint_url}' );" $cur_dir/wp-config.php
                echo "[$(TZ=America/Detroit date +'%x %X %Z')] >>>> ${green}➕ BML_ENDPOINT added to wp-config.php!${reset}"
            fi
            break;;
		[Nn]* ) break;;
		* ) echo "Please answer yes or no.";;
	esac
done

# Ask if we want to enable access filter.
while true; do
	read -p "${green}✅ Block all access, unless you visit /?bml=true, which sets a cookie?${reset} (y/n)" yn
	case $yn in
		[Yy]* )
            # Check if BML_ALLOWED already exists.
            if grep -q "BML_ALLOWED" $cur_dir/wp-config.php; then
                # Confirmation.
                echo "[$(TZ=America/Detroit date +'%x %X %Z')] >>>> ${green}⚡️ BML_ALLOWED already set!${reset}"
            else
                # Add BML_ALLOWED to wp-config.php after $table_prefix = 'wp_';.
                sed -i "/$table_prefix = 'wp_';/a # Built Mighty Access\ndefine( 'BML_ALLOWED', 'true' );" $cur_dir/wp-config.php
                echo "[$(TZ=America/Detroit date +'%x %X %Z')] >>>> ${green}➕ BML_ALLOWED added to wp-config.php!${reset}"
            fi
            break;;
		[Nn]* ) break;;
		* ) echo "Please answer yes or no.";;
	esac
done

# Finish.
printf "\n [$(TZ=America/Detroit date +'%x %X %Z')] >>>> 🥳 All done! \n\n";

# ------------------------------------------------------------------------------------------------
