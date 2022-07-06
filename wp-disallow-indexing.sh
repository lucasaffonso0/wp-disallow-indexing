hosts=`ls /var/www/vhosts/`

for host in $hosts;do
    path="/var/www/vhosts/${host}/httpdocs"
    db_prefix=`cat /var/www/vhosts/${host}/httpdocs/wp-config.php | grep table_prefix | cut -d"'" -f 2`
    wp db query "UPDATE ${db_prefix}options SET option_value = 0 WHERE option_name = 'blog_public';" --allow-root --path=$path
done
