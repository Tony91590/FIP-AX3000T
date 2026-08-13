# diy ATF and u-boot for xiaomi ax3000t based on mt798x [arm-trusted-firmware-mediatek/patches/0999-mt7921-oc-1.6G.patch]

PATCH_FILE="$GITHUB_WORKSPACE/diff.patch"
patch -p1 < "$PATCH_FILE"

rm -f uboot-mtk-20250711/arch/arm/dts/mt7981-ax3000t.dts.orig
rm -f uboot-mtk-20250711/cmd/glbtn.c.orig
rm -f atf-20240117-bacca82a8/plat/mediatek/mt7981/drivers/pll/pll.c.orig
rm -f atf-20250711/plat/mediatek/mt7981/drivers/pll/pll.c.orig
