# diy ATF and u-boot for xiaomi ax3000t based on mt798x

PATCH_FILE="$GITHUB_WORKSPACE/diff.patch"
patch -p1 < "$PATCH_FILE"

rm -f uboot-mtk-20230718-09eda825/cmd/glbtn.c.orig
rm -f uboot-mtk-20230718-09eda825/arch/arm/dts/mt7981-ax3000t.dts.orig
rm -f atf-20231013-0ea67d76a/plat/mediatek/mt7981/drivers/pll/pll.c.orig
rm -f atf-20231013-0ea67d76a/plat/mediatek/mt7981/drivers/pll/pll.h.orig
rm -f atf-20220606-637ba581b/configs/mt7981_ax3000t_defconfig.orig
