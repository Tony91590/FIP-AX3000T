# Vérifier le nom de Factory
cat /proc/mtd

# Sauvegarde originale — NE PAS modifier celle-ci
nanddump -f /tmp/factory_backup.bin /dev/mtd4

# Copie de travail
cp /tmp/factory_backup.bin /tmp/factory_dump.bin

# 2.4 GHz : offset 0x441, 4 octets = 30 30 31 31
printf '\x30\x30\x31\x31' | dd of=/tmp/factory_dump.bin bs=1 seek=$((0x441)) conv=notrunc

# 5 GHz : offset 0x445, 20 octets = 2E x20
printf '\x2e%.0s' $(seq 1 20) | dd of=/tmp/factory_dump.bin bs=1 seek=$((0x445)) conv=notrunc

