# diy ATF and u-boot for xiaomi ax3000t based on mt798x

rm -f build.sh

git clone -b test https://github.com/Tony91590/bl-mt798x.git tmp_imm
cp -r tmp_imm/build.sh ./
rm -rf tmp_imm

BUILD_SH="build.sh"

UBOOT_SEL=2
ATF_SEL=2

case $UBOOT_SEL in
    1) UBOOT="uboot-mtk-20220606" ;;
    2) UBOOT="uboot-mtk-20230718-09eda825" ;;
esac

case $ATF_SEL in
    1) ATF="atf-20220606-637ba581b" ;;
    2) ATF="atf-20231013-0ea67d76a" ;;
    3) ATF="atf-20240117-bacca82a8" ;;
esac

sed -i -E "s|^[# ]*UBOOT_DIR=.*|UBOOT_DIR=$UBOOT|" "$BUILD_SH"
sed -i -E "s|^[# ]*ATF_DIR=.*|ATF_DIR=$ATF|" "$BUILD_SH"

PATCH_FILE="$GITHUB_WORKSPACE/diff.patch"
patch -p1 < "$PATCH_FILE"

git clone -b test https://github.com/Tony91590/bl-mt798x.git tmp_imm
cp -r tmp_imm/atf-20240117-bacca82a8 ./
rm -rf tmp_imm

rm -f uboot-mtk-20220606/cmd/glbtn.c.orig
rm -f uboot-mtk-20220606/arch/arm/dts/mt7981-ax3000t.dts.orig
rm -f atf-20220606-637ba581b/configs/mt7981_ax3000t_defconfig.orig
rm -f uboot-mtk-20230718-09eda825/cmd/glbtn.c.orig
rm -f uboot-mtk-20230718-09eda825/arch/arm/dts/mt7981-ax3000t.dts.orig
