# diy ATF and u-boot for xiaomi ax3000t based on mt798x

BUILD_SH="build.sh"

# Choix des versions
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

sed -i "s|^# *UBOOT_DIR=.*|UBOOT_DIR=$UBOOT|" "$BUILD_SH"
sed -i "s|^# *ATF_DIR=.*|ATF_DIR=$ATF|" "$BUILD_SH"

git clone -b 2023 https://github.com/Tony91590/bl-mt798x.git tmp_imm
cp -r tmp_imm/atf-20231013-0ea67d76a ./
rm -rf tmp_imm

PATCH_FILE="$GITHUB_WORKSPACE/diff.patch"
patch -p1 < "$PATCH_FILE"

rm -f uboot-mtk-20220606/cmd/glbtn.c.orig
rm -f uboot-mtk-20220606/arch/arm/dts/mt7981-ax3000t.dts.orig
rm -f uboot-mtk-20230718-09eda825/cmd/glbtn.c.orig
rm -f uboot-mtk-20230718-09eda825/arch/arm/dts/mt7981-ax3000t.dts.orig
