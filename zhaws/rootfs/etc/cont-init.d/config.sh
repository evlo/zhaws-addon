#!/usr/bin/with-contenv bashio
# ==============================================================================
# Generate ZHAWS config file
# ==============================================================================
declare network_auto_start
declare enable_quirks
declare radio_type
declare radio_path
declare radio_baudrate
declare radio_flow_control

radio_type=$(bashio::config "radio_type")
radio_path=$(bashio::config "device")
radio_baudrate=$(bashio::config "radio_baudrate")
radio_flow_control=$(bashio::config "radio_flow_control")
network_auto_start=$(bashio::config "network_auto_start")
enable_quirks=$(bashio::config "enable_quirks")

# Generate config
bashio::var.json \
    radio_type "${radio_type}" \
    radio_path "${radio_path}" \
    radio_baudrate "${radio_baudrate}" \
    radio_flow_control "${radio_flow_control}" \
    network_auto_start "${network_auto_start}" \
    enable_quirks "${enable_quirks}" \
    host "$(hostname)" \
    port "^8001" \
    | tempio \
        -template /usr/share/tempio/zhaws.conf \
        -out /etc/zhaws_config.json
