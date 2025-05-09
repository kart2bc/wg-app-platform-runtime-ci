function configure_rsyslog() {
    local rsyslog_pid=$(pidof rsyslogd || true)
    if [[ -z "${rsyslog_pid}" ]]; then
        rsyslogd
    else
        kill -HUP "$(pidof rsyslogd)"
    fi
}
echo "test"
export -f configure_rsyslog
