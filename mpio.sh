esxcli storage nmp satp rule add -s VMW_SATP_ALUA -V "TrueNAS" -M "iSCSI Disk" -P VMW_PSP_RR -O iops=1 -e "TrueNAS SATP rule"


for i in `esxcfg-scsidevs -c |awk '{print $1}' | grep naa.6589`; do esxcli storage nmp psp roundrobin deviceconfig set --type=iops --iops=1 --device=$i; done
