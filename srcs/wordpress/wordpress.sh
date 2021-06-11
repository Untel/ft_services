if ! $(su -c 'wp core is-installed --path="/var/www"' - www); then
    su -c 'wp core install --path="/var/www" --url="172.17.0.2:5050" --title="WP Adda-sil" --admin_user="wpadda" --admin_password="wpadda" --admin_email="adrien@fernandes.bzh"' - www
    su -c 'wp user create --path="/var/www" "adda-sil" "adda-sil@student.42.fr" --user_pass="adda-sil" --role="editor"' - www
    su -c 'wp user create --path="/var/www" "roalvare" "roalvare@student.42.fr" --user_pass="roalvare" --role="author"' - www
    su -c 'wp user create --path="/var/www" "mchardin" "mchardin@student.42.fr" --user_pass="mchardin" --role="contributor"' - www
fi

/usr/bin/supervisord -c /etc/supervisord.conf