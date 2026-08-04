# diy ATF and u-boot for xiaomi ax3000t based on mt798x

PATCH_FILE="$GITHUB_WORKSPACE/diff.patch"
patch -p1 < "$PATCH_FILE"

rm -f uboot-mtk-20230718-09eda825/cmd/glbtn.c.orig
rm -f atf-20240117-bacca82a8/plat/mediatek/mt7981/drivers/pll/pll.c.orig
rm -f atf-20240117-bacca82a8/plat/mediatek/mt7981/drivers/pll/pll.h.orig
rm -f uboot-mtk-20230718-09eda825/arch/arm/dts/mt7981-ax3000t.dts.orig
