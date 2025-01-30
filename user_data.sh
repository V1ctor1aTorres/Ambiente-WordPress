#!/bin/bash
sudo yum update -y

# ---- Instalar WordPress ----
sudo amazon-linux-extras enable php7.4
sudo yum clean metadata
sudo yum install -y httpd php php-mysqlnd php-cli php-json php-xml php-mbstring
sudo systemctl start httpd
sudo systemctl enable httpd
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
mv wordpress/* .
rmdir wordpress
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html

# ---- Instalar Node Exporter ----
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.0/node_exporter-1.6.0.linux-amd64.tar.gz
tar -xvzf node_exporter-1.6.0.linux-amd64.tar.gz
mv node_exporter-1.6.0.linux-amd64 /opt/node_exporter
nohup /opt/node_exporter/node_exporter &

# ---- Instalar Prometheus ----
wget https://github.com/prometheus/prometheus/releases/download/v2.46.0/prometheus-2.46.0.linux-amd64.tar.gz
tar -xvzf prometheus-2.46.0.linux-amd64.tar.gz
mv prometheus-2.46.0.linux-amd64 /opt/prometheus
cat <<EOT > /opt/prometheus/prometheus.yml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'node_exporter'
    static_configs:
      - targets: ['localhost:9100'] # Node Exporter local
EOT
nohup /opt/prometheus/prometheus --config.file=/opt/prometheus/prometheus.yml &

# ---- Instalar Grafana ----
sudo yum install -y https://dl.grafana.com/oss/release/grafana-10.0.0-1.x86_64.rpm
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

echo "Instância configurada com WordPress, Prometheus e Grafana."
