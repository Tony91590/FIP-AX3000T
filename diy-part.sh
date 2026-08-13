# diy ATF and u-boot for xiaomi ax3000t based on mt798x [arm-trusted-firmware-mediatek/patches/0999-mt7921-oc-1.6G.patch]

PATCH_FILE="$GITHUB_WORKSPACE/diff.patch"
patch -p1 < "$PATCH_FILE"

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
