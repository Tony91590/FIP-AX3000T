# diy ATF and u-boot for xiaomi ax3000t based on mt798x

PATCH_FILE="$GITHUB_WORKSPACE/diff.patch"
patch -p1 < "$PATCH_FILE"

rm -f uboot-mtk-20220606/cmd/glbtn.c.orig
rm -f uboot-mtk-20220606/arch/arm/dts/mt7981-ax3000t.dts.orig
