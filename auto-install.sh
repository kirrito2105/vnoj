sudo apt update - y
sudo apt install -y git gcc g++ make python3-dev python3-pip python3-venv libxml2-dev libxslt1-dev zlib1g-dev gettext curl redis-server pkg-config virtualenv memcached build-essential libseccomp-dev
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm install -g sass postcss-cli postcss autoprefixer
sudo apt update -y
sudo apt install -y mariadb-server libmysqlclient-dev
sudo service mysql start
sudo mysql -e "CREATE DATABASE dmoj DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_general_ci;"
sudo mysql -e "GRANT ALL PRIVILEGES ON dmoj.* TO 'dmoj'@'localhost' IDENTIFIED BY 'greenhat1998';"
mariadb-tzinfo-to-sql /usr/share/zoneinfo | sudo mariadb -u root mysql
cd site
pip3 install mysqlclient==2.1.1
pip3 install websocket-client
pip3 install -r requirements.txt
pip3 install lxml_html_clean
npm install
mkdir problems media static
./make_style.sh
python3 manage.py collectstatic
python3 manage.py compilemessages
python3 manage.py compilejsi18n
python3 manage.py migrate
python3 manage.py loaddata navbar
python3 manage.py loaddata language_small
python3 manage.py loaddata demo
python3 manage.py addjudge judge01 "abcdefghijklmnopqrstuvwxyz"
pip3 install dmoj
