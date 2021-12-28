# compose-secure-firefly
A project to easily deploy firefly III server with Docker Compose

## Crontab
>
>\#firefly crontab
>
>0 0 * * * docker exec -i firefly-iii_firefly_1 /usr/local/bin/php /var/www/html/artisan firefly-iii:cron
>
>\# firefly db-backup
>
>15 0 * * * bash /root/firefly-iii/create-backup.sh
>