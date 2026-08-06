# diy ATF and u-boot for xiaomi ax3000t based on mt798x

BUILD_SH="build.sh"

UBOOT_SEL=1
ATF_SEL=1

case $UBOOT_SEL in
    1) UBOOT="uboot-mtk-20220606" ;;
    2) UBOOT="uboot-mtk-20230718-09eda825" ;;
esac

case $ATF_SEL in
    1) ATF="atf-20220606-637ba581b" ;;
    2) ATF="atf-20240117-bacca82a8" ;;
esac

sed -i -E "s|^[# ]*UBOOT_DIR=.*|UBOOT_DIR=$UBOOT|" "$BUILD_SH"
sed -i -E "s|^[# ]*ATF_DIR=.*|ATF_DIR=$ATF|" "$BUILD_SH"

sed -i 's/^CONFIG_TARGET_FIP_NO_SEC_BOOT=.*/CONFIG_TARGET_ALL_NO_SEC_BOOT=y/' \
    atf-20220606-637ba581b/configs/mt7981_ax3000t_defconfig
    
PATCH_FILE="$GITHUB_WORKSPACE/diff.patch"
patch -p1 < "$PATCH_FILE"

rm -f uboot-mtk-20230718-09eda825/cmd/glbtn.c.orig
rm -f atf-20220606-637ba581b/plat/mediatek/mt7981/drivers/pll/pll.c.orig
rm -f atf-20240117-bacca82a8/plat/mediatek/mt7981/drivers/pll/pll.c.orig
rm -f atf-20240117-bacca82a8/plat/mediatek/mt7981/drivers/pll/pll.h.orig
rm -f uboot-mtk-20230718-09eda825/arch/arm/dts/mt7981-ax3000t.dts.orig
rm -f uboot-mtk-20220606/cmd/glbtn.c.orig
rm -f uboot-mtk-20220606/arch/arm/dts/mt7981-ax3000t.dts.orig

#!/bin/sh

# =====================================
# Sélection de la fréquence ARMPLL
# Modifier uniquement FREQ_SELECT
# =====================================

		 *   PCW = Fcpu(MHz) / 20
+		 * Examples:
+		 *   1400MHz -> PCW=0x46 -> ARMPLL_CON1=0x46000000
+		 *   1500MHz -> PCW=0x4B -> ARMPLL_CON1=0x4B000000
+		 *   1600MHz -> PCW=0x50 -> ARMPLL_CON1=0x50000000
+		 *   1700MHz -> PCW=0x55 -> ARMPLL_CON1=0x55000000
+		 *   1800MHz -> PCW=0x5A -> ARMPLL_CON1=0x5A000000

# 1 = 1400MHz 0x46000000
# 2 = 1500MHz 0x4B000000
# 3 = 1600MHz 0x50000000
# 4 = 1640MHz 0x52000000
# 5 = 1700MHz 0x55000000

FREQ_SELECT=2


case "$FREQ_SELECT" in
	1)
		FREQ="0x46000000"   # 1400MHz
		;;
	2)
		FREQ="0x4B000000"   # 1500MHz
		;;
	3)
		FREQ="0x50000000"   # 1600MHz
		;;   
	4)
		FREQ="0x52000000"   # 1640MHz
		;;
	5)
		FREQ="0x55000000"   # 1700MHz
		;;
	*)
		echo "Erreur sélection fréquence"
		exit 1
		;;
esac


# =====================================
# Fichiers ATF à modifier
# =====================================

FILES="
atf-20220606-637ba581b/plat/mediatek/mt7981/drivers/pll/pll.c
atf-20231013-0ea67d76a/plat/mediatek/mt7981/drivers/pll/pll.c
atf-20240117-bacca82a8/plat/mediatek/mt7981/drivers/pll/pll.c
atf-20250711/plat/mediatek/mt7981/drivers/pll/pll.c
"


# =====================================
# Modification freq_overclock
# =====================================

for FILE in $FILES
do
	if [ -f "$FILE" ]; then

		echo "Modification : $FILE"
		echo "Nouvelle valeur : $FREQ"

		sed -i -E \
		"s/(static uint32_t freq_overclock = ).*;/\1$FREQ;/" \
		"$FILE"

	else
		echo "Fichier introuvable : $FILE"
	fi
done


# =====================================
# Vérification
# =====================================

echo
echo "Valeur actuelle :"

for FILE in $FILES
do
	if [ -f "$FILE" ]; then
		echo "$FILE"
		grep freq_overclock "$FILE"
		echo
	fi
done

echo "Modification terminée."
