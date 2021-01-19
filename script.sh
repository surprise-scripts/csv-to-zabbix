cat << eof
<?xml version="1.0" encoding="UTF-8"?>
<zabbix_export>
    <version>5.0</version>
    <date>2021-01-19T03:07:54Z</date>
    <groups>
        <group>
            <name>Hypervisors</name>
        </group>
        <group>
            <name>Linux servers</name>
        </group>
    </groups>
    <hosts>
eof

while read line
do
    if [ ! -z "$line" ] ; then
        HOST_NAME=`echo $line | cut -d',' -f1`
        HOST_SHORT=`echo $HOST_NAME | cut -d'.' -f1`
        HOST_IP=`echo $line | cut -d',' -f2`
        HOST_GROUP=`echo $line | cut -d',' -f3`
        HOST_TEMPLATE=`echo $line | cut -d',' -f4`
    

cat << eof
        <host>
            <host>${HOST_NAME}</host>
            <name>${HOST_SHORT}</name>
            <templates>
                <template>
                    <name>${HOST_TEMPLATE}</name>
                </template>
            </templates>
            <groups>
                <group>
                    <name>${HOST_GROUP}</name>
                </group>
            </groups>
            <interfaces>
                <interface>
                    <type>SNMP</type>
                    <ip>${HOST_IP}</ip>
                    <dns>${HOST_NAME}</dns>
                    <port>161</port>
                    <details>
                        <community>{\$SNMP_COMMUNITY}</community>
                    </details>
                    <interface_ref>if1</interface_ref>
                </interface>
            </interfaces>
            <inventory_mode>DISABLED</inventory_mode>
        </host>
eof
    fi
done < sample.csv

cat << eof
    </hosts>
</zabbix_export>
eof
