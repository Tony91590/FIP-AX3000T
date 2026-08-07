# diy ATF and u-boot for xiaomi ax3000t based on mt798x

BUILD_SH="build.sh"

UBOOT_SEL=1
ATF_SEL=3

case $UBOOT_SEL in
    1) UBOOT="uboot-mtk-20220606" ;;
    2) UBOOT="uboot-mtk-20230718-09eda825" ;;
    3) UBOOT="uboot-mtk-20250711" ;;
esac

case $ATF_SEL in
    1) ATF="atf-20220606-637ba581b" ;;
    2) ATF="atf-20231013-0ea67d76a" ;;
    3) ATF="atf-20240117-bacca82a8" ;;
    4) ATF="atf-20250711" ;;
esac

sed -i -E "s|^[# ]*UBOOT_DIR=.*|UBOOT_DIR=$UBOOT|" "$BUILD_SH"
sed -i -E "s|^[# ]*ATF_DIR=.*|ATF_DIR=$ATF|" "$BUILD_SH"

git clone -b 2023 https://github.com/Tony91590/bl-mt798x.git tmp_imm
cp -r tmp_imm/atf-20231013-0ea67d76a ./
rm -rf tmp_imm

PATCH_FILE="$GITHUB_WORKSPACE/diff.patch"
patch -p1 < "$PATCH_FILE"

rm -f uboot-mtk-20220606/cmd/glbtn.c.orig
rm -f uboot-mtk-20220606/arch/arm/dts/mt7981-ax3000t.dts.orig
rm -f uboot-mtk-20230718-09eda825/cmd/glbtn.c.orig
rm -f uboot-mtk-20230718-09eda825/arch/arm/dts/mt7981-ax3000t.dts.orig
rm -f uboot-mtk-20250711/cmd/glbtn.c.orig
rm -f uboot-mtk-20250711/arch/arm/dts/mt7981-ax3000t.dts.orig

# =====================================
# Sélection de la fréquence ARMPLL
# Modifier uniquement FREQ_SELECT
# =====================================

# 1 = 1400MHz 0x46000000
# 2 = 1500MHz 0x4B000000
# 3 = 1600MHz 0x50000000
# 4 = 1640MHz 0x52000000
# 5 = 1700MHz 0x55000000

FREQ_SELECT=5


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
