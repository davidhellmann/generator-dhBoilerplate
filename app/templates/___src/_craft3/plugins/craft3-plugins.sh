#!/bin/sh
echo
echo
echo
echo   /$$$$$$                      /$$$$$$   /$$           /$$$$$$$  /$$                     /$$
echo  /$$__  $$                    /$$__  $$ | $$          | $$__  $$| $$                    |__/
echo | $$  \__/  /$$$$$$  /$$$$$$ | $$  \__//$$$$$$        | $$  \ $$| $$ /$$   /$$  /$$$$$$  /$$ /$$$$$$$   /$$$$$$$
echo | $$       /$$__  $$|____  $$| $$$$   |_  $$_/        | $$$$$$$/| $$| $$  | $$ /$$__  $$| $$| $$__  $$ /$$_____/
echo | $$      | $$  \__/ /$$$$$$$| $$_/     | $$          | $$____/ | $$| $$  | $$| $$  \ $$| $$| $$  \ $$|  $$$$$$
echo | $$    $$| $$      /$$__  $$| $$       | $$ /$$      | $$      | $$| $$  | $$| $$  | $$| $$| $$  | $$ \____  $$
echo |  $$$$$$/| $$     |  $$$$$$$| $$       |  $$$$/      | $$      | $$|  $$$$$$/|  $$$$$$$| $$| $$  | $$ /$$$$$$$/
echo  \______/ |__/      \_______/|__/        \___/        |__/      |__/ \______/  \____  $$|__/|__/  |__/|_______/
echo                                                                                /$$  \ $$
echo                                                                               |  $$$$$$/
echo                                                                                \______/
echo
echo
echo

# https://github.com/nystudio107/craft3-minify
composer require nystudio107/craft3-minify

# https://github.com/nystudio107/craft3-cookies
composer require nystudio107/craft3-cookies

# https://github.com/craftcms/mailgun
composer require craftcms/mailgun

# https://github.com/TopShelfCraft/Craft3-Walk
composer require topshelfcraft/craft3-walk
