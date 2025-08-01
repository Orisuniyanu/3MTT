# MONITOR LINUX SERVER USING PROMETHEUS NODE EXPORTER

## Introduction

Monitoring a Linux server is essential for ensuring system health and performance. Prometheus Node Exporter is a powerful tool that collects hardware and operating system metrics, providing deep insights into server's state per time. This project will guild me through installing and configuring Prometheus Node Exporter on a Linux server and monitoring it with Prometheus.

## Objectives

1. Install and configure Prometheus Node Exporter on a Linux server.
2. Integrate Node Exporter with Prometheus for metric collection.
3. Explore system metric collected by Node Exporter.
4. Set up basic queries in Prometheus for real-time monitoring.
5. Optionally configure alerts for key metrics.

## Prerequisites

1. **Linux Server:** A running Linux server with **sudo** privileges.
2. **Prometheus Instance:** A working Prometheus setup (local or remote).
3. **Network Access:** Ensure Prometheus can connect to the Linux server on port **9100**.
4. **Tools:** Terminal access to the Linux server, Prometheus UI access, and a text editor for authoring configuration files.

## Project Tasks

### Task 1 - Install Prometheus Node EXporter

1. Download the latest Node Exporter binary from the Prometheus GitHub release page.

```bash
curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.9.1/node_exporter-1.9.1.linux-amd64.tar.gz
```

2. Extract the downloaded tarball.

```bash
tar -xvf node_exporter-1.9.1.linux-amd64.tar.gz
```

3. Movw the binary to a directory in my PATH.

```bash
sudo mv node_exporter-linux-amd64/node_exporter /usr/local/bin/
```

![1. Task 1](./IMG/1.%20Task%201.png)

### Task 2 - Start and Enable Node Exporter as a Service

1. Create a systemd service file for Node Exporter by running the command below.

```bash
sudo nano /etc/systemd/system/node_exporter.service
```

2. Add the following content to the file created above.

```bash
[Unit]
Description=Prometheus Node Exporter
After=network.target

[Service]
User=nobody
ExecStart=/usr/local/bin/node_exporter
Restart=always

[Install]
WantedBy=multi-user.target
```

3. Reload systemd and start the Node Exporter service using the following commands.

```bash
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter
```

4. Verify that Node Exporter is running with this command.

```bash
sudo systemctl status node_exporter
```

![Task 2](./IMG/Task%202.png)

5. Confirm Node Exporter is accesssible by visting `http://192.168.0.**:9100/metrics` in a web browser. 
**Note:** This server does not have GUI so I forward the port to my windows server where I can see the content via GUI.

![3. Browser](./IMG/3.%20Browser.png)
![4. Browser1](./IMG/4.%20Browser1.png)

### Task 3 - Configure Prometheus to Scrape Metrics from Node Exporter

1. Download and extract Prometheus

```bash
cd /opt
sudo curl -LO https://github.com/prometheus/prometheus/releases/download/v3.5.0/prometheus-3.5.0.linux-amd64.tar.gz
sudo tar -xvf prometheus-3.5.0.linux-amd64.tar.gz
sudo mv prometheus-*.linux-amd64 prometheus
```

![5. Prometheus](./IMG/5.%20Prometheus.png)

2. Move binaries and create user

```bash
sudo useradd --no-create-home --shell /bin/false prometheus

sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

sudo cp /opt/prometheus/prometheus /usr/local/bin/
sudo cp /opt/prometheus/promtool /usr/local/bin/

sudo cp -r /opt/prometheus/consoles /etc/prometheus
sudo cp -r /opt/prometheus/console_libraries /etc/prometheus
sudo cp /opt/prometheus/prometheus.yml /etc/prometheus/
```

Set ownership:

```bash
sudo chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus /usr/local/bin/prometheus /usr/local/bin/promtool
```

![6. Move](./IMG/6.%20Move.png)

3. Open the Prometheus configuration file (**prometheus.yml).

```bash
sudo nano /etc/prometheus/prometheus.yml
```

4. Add a new scrape job for Node Exporter.

```bash
scrape_configs:
  - job_name: "prometheus"
    static_configs:
      - targets: ["localhost:9090"]
        labels:
          app: "prometheus"

  - job_name: "node-exporter"
    static_configs:
      - targets: ["192.168.0.**:9100"]
```

5. Save the file and restart Prometheus to apply the changes.

```bash
sudo systemctl restart prometheus
```

![7. Prometheus Running](./IMG/7.%20Prometheus%20Running.png)

### Task 4 - Verify and Query Node Exporter Metrics in Prometheus

1. Access the prometheus web interface (**http://192.168.0.**:9090).
2. Run a test query to verify Node Exporter metrics.

- Example: **node_cpu_seconds_total** to view CPU usage.

3. Check the "Target" page in Premetheus to confirm the Node Exporter target is listed and "UP".

![8. Target](./IMG/8.%20Target.png)

### Task 5 - Explore and Analyze Metrics

1. Use the Prometheus query interface to explore key Node Exporter metrics:

- **node_memory_MemAvailable_bytes** for Available Memory.
- **node_filesystem_avail_bytes** for Available Disk Space.
- **node_network_receive_bytes_total** Network Bytes Received.

2. Create basic time-serires graphs using Prometheus expressions (PromQL).

- Example: **rate(node_cpu_seconds_total[5m]) to analyze CPU usage over the last 5 minutes.

3. Optionally, set up alert rules for critical metrics like high CPU usage or low disk space.
![9. Memory Available](./IMG/9.%20Memory%20Available.png)
![10. Network](./IMG/10.%20Network.png)
![11. Node CPU](./IMG/11.%20Node%20CPU.png)

## Conclusion

In this project, I installed and configured Prometheus Node Exporter on a Linux server, integrated it with Prometheus, and explored collected metrics. These skills provide a strong foundation for monitoring server health and performance, and I can now extend this setup by adding advanced visualization tool like `Grafana`.