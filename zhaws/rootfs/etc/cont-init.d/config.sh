#!/usr/bin/with-contenv bashio
# ==============================================================================
# Generate ZHAWS config file
# ==============================================================================
declare log_level
declare flush_to_disk
declare host_chassis
declare soft_reset

if  ! bashio::config.has_value 'log_level'; then
    log_level=$(bashio::info.logging)
    bashio::log.info "No log level specified, falling back to Supervisor"
    bashio::log.info "log level (${log_level})..."
else
    log_level=$(bashio::config 'log_level')
fi

host_chassis=$(bashio::host.chassis)

if [ "${host_chassis}" == "vm" ]; then
    soft_reset=false
    bashio::log.info "Virtual Machine detected, disabling soft-reset"
else
    soft_reset=true
    bashio::log.info "Virtual Machine not detected, enabling soft-reset"
fi


# Generate config
bashio::var.json \
    log_level "${log_level}" \
    soft_reset "^${soft_reset}" \
    | tempio \
        -template /usr/share/tempio/zhaws.conf \
        -out /etc/zhaws.json
