#!/bin/bash

mkdir -p /var/www/html

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar

./wp-cli.phar core download --allow-root
./wp-cli.phar config create \
  --dbname=$db_name \
  --dbuser=$db_user \
  --dbpass=$db_user_pass \
  --dbhost=mariadb \
  --allow-root
./wp-cli.phar core install \
  --url=$ip_addr \
  --title="INCEPTION" \
  --admin_user=$wp_admin \
  --admin_password=$wp_admin_pass \
  --admin_email=$wp_admin_email \
  --allow-root
./wp-cli.phar user create \
  $wp_user \
  $wp_user_email \
  --user_pass=$wp_user_pass \
  --role=author \
  --allow-root

./wp-cli.phar plugin install redis-cache --activate --allow-root
./wp-cli.phar config set WP_REDIS_HOST "redis" --allow-root
./wp-cli.phar config set WP_REDIS_PORT "6379" --allow-root
./wp-cli.phar plugin activate redis-cache --allow-root
./wp-cli.phar redis enable --allow-root

./wp-cli.phar theme install https://public-api.wordpress.com/rest/v1/themes/download/lowfi.zip --allow-root
./wp-cli.phar theme activate lowfi-wpcom --allow-root

if [ ! -f .first_timer ]; then

	HOME_PAGE_ID=$(./wp-cli.phar post create \
	    --post_type=page \
	    --post_title="Welcome to My Awesome Site" \
	    --post_status=publish \
	    --post_content="<h2>This site is powered by Docker, WordPress, and Redis!</h2><p>This entire page was created automatically by a script. How cool is that?</p>" \
	    --porcelain \
	    --allow-root)

	./wp-cli.phar option update show_on_front page --allow-root
	./wp-cli.phar option update page_on_front $HOME_PAGE_ID --allow-root

	FOOTER_FILE="/var/www/html/wp-content/themes/lowfi-wpcom/patterns/footer.php"

	sed -i '/wp:social-link {"url":"https:\/\/twitter.com\//d' "$FOOTER_FILE"
	sed -i '/wp:social-link {"url":"https:\/\/tumblr.com\//d' "$FOOTER_FILE"
	sed -i 's/WordPress<\/a>/yuuta<\/a>/g' "$FOOTER_FILE"

	sed -i 's|https://instagram.com/"|https://instagram.com/fw.yuuta"|g' "$FOOTER_FILE"
	sed -i 's|https://wordpress.org|https://profile.intra.42.fr/users/yoayedde|g' "$FOOTER_FILE"
	sed -i 's/Designed with/Made by /g' "$FOOTER_FILE"

	touch .first_timer
	chmod 775 .first_timer 

fi

exec php-fpm8.2 -F
