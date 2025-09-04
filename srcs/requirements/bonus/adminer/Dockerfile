FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install adminer php -y

RUN mv /usr/share/adminer/adminer.php /usr/share/adminer/index.php

CMD ["php", "-S", "[::]:1001", "-t", "/usr/share/adminer/"]
