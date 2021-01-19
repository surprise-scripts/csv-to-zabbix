Converts a specific CSV document to an importable Zabbix XML file. Should speed up adding multiple hosts if you know some basic information ahead of time.

I recommend taking an export of a similar host and using it's data to compile your CSV. The script expects DNS name to be a FQDN and striples the TLD and SLD to create a shorter hostname for the display name. You can remove this by just putting $HOST_SHORT = $HOST_NAME in the script after the initial declaration.

If you're creating from a single line CSV file, there `while` loop will not work. Add an empty line to work around it, hence the inverse -z check.

Quick, dirty, effective.

This script assumes you're not an idiot.