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
    2) ATF="atf-20231013-0ea67d76a" ;;
    3) ATF="atf-20240117-bacca82a8" ;;
esac

sed -i -E "s|^[# ]*UBOOT_DIR=.*|UBOOT_DIR=$UBOOT|" "$BUILD_SH"
sed -i -E "s|^[# ]*ATF_DIR=.*|ATF_DIR=$ATF|" "$BUILD_SH"

PATCH_FILE="$GITHUB_WORKSPACE/diff.patch"
patch -p1 < "$PATCH_FILE"

rm -f atf-20220606-637ba581b/configs/mt7981_360t7_defconfig.orig
rm -f atf-20220606-637ba581b/configs/mt7981_abt_asr3000_defconfig.orig
rm -f atf-20220606-637ba581b/configs/mt7981_ax3000t_defconfig.orig
rm -f atf-20220606-637ba581b/configs/mt7981_cetron_ct3003_defconfig.orig
rm -f atf-20220606-637ba581b/configs/mt7981_cmcc_a10_defconfig.orig
rm -f atf-20220606-637ba581b/configs/mt7981_cmcc_rax3000m_defconfig.orig
rm -f atf-20220606-637ba581b/configs/mt7981_cudy_tr3000-v1_defconfig.orig
rm -f atf-20220606-637ba581b/configs/mt7981_h3c_magic-nx30-pro_defconfig.orig
rm -f atf-20220606-637ba581b/configs/mt7981_imou_lc-hx3001_defconfig.orig
rm -f atf-20220606-637ba581b/configs/mt7981_jcg_q30_defconfig.orig
rm -f atf-20220606-637ba581b/configs/mt7981_konka_komi-a31_defconfig.orig
rm -f atf-20220606-637ba581b/configs/mt7981_livinet_zr-3020_defconfig.orig
rm -f atf-20220606-637ba581b/configs/mt7981_nokia_ea0326gmp_defconfig.orig
rm -f atf-20220606-637ba581b/configs/mt7981_wr30u_defconfig.orig
rm -f atf-20220606-637ba581b/configs/mt7986_netcore_n60-pro_defconfig.orig
rm -f atf-20220606-637ba581b/configs/mt7986_netcore_n60_defconfig.orig
rm -f atf-20220606-637ba581b/configs/mt7986_redmi_ax6000_defconfig.orig
rm -f atf-20240117-bacca82a8/configs/mt7981_360t7_defconfig.orig
rm -f atf-20240117-bacca82a8/configs/mt7981_abt_asr3000_defconfig.orig
rm -f atf-20240117-bacca82a8/configs/mt7981_ax3000t_defconfig.orig
rm -f atf-20240117-bacca82a8/configs/mt7981_cetron_ct3003_defconfig.orig
rm -f atf-20240117-bacca82a8/configs/mt7981_cmcc_a10_defconfig.orig
rm -f atf-20240117-bacca82a8/configs/mt7981_cmcc_rax3000m_defconfig.orig
rm -f atf-20240117-bacca82a8/configs/mt7981_cudy_tr3000-v1_defconfig.orig
rm -f atf-20240117-bacca82a8/configs/mt7981_h3c_magic-nx30-pro_defconfig.orig
rm -f atf-20240117-bacca82a8/configs/mt7981_imou_lc-hx3001_defconfig.orig
rm -f atf-20240117-bacca82a8/configs/mt7981_jcg_q30_defconfig.orig
rm -f atf-20240117-bacca82a8/configs/mt7981_konka_komi-a31_defconfig.orig
rm -f atf-20240117-bacca82a8/configs/mt7981_livinet_zr-3020_defconfig.orig
rm -f atf-20240117-bacca82a8/configs/mt7981_nokia_ea0326gmp_defconfig.orig
rm -f atf-20240117-bacca82a8/configs/mt7981_wr30u_defconfig.orig
rm -f atf-20240117-bacca82a8/configs/mt7986_netcore_n60-pro_defconfig.orig
rm -f atf-20240117-bacca82a8/configs/mt7986_netcore_n60_defconfig.orig
rm -f atf-20240117-bacca82a8/configs/mt7986_redmi_ax6000_defconfig.orig
rm -f uboot-mtk-20220606/arch/arm/dts/mt7981-abt_asr3000.dts.orig
rm -f uboot-mtk-20220606/arch/arm/dts/mt7981-cetron_ct3003.dts.orig
rm -f uboot-mtk-20220606/arch/arm/dts/mt7981-cmcc-rax3000m-emmc.dts.orig
rm -f uboot-mtk-20220606/arch/arm/dts/mt7981-cmcc-rax3000m.dts.orig
rm -f uboot-mtk-20220606/arch/arm/dts/mt7981-konka_komi-a31.dts.orig
rm -f uboot-mtk-20220606/arch/arm/dts/mt7981-livinet_zr-3020.dts.orig
rm -f uboot-mtk-20220606/arch/arm/dts/mt7981-nokia-ea0326gmp.dts.orig
rm -f uboot-mtk-20220606/arch/arm/dts/mt7986a-jdcloud_re-cp-03.dts.orig
rm -f uboot-mtk-20220606/board/mediatek/common/ubi_helper.c.orig
rm -f uboot-mtk-20220606/board/mediatek/mt7622/bootmenu_emmc.c.orig
rm -f uboot-mtk-20220606/board/mediatek/mt7981/bootmenu_emmc.c.orig
rm -f uboot-mtk-20220606/board/mediatek/mt7986/bootmenu_emmc.c.orig
rm -f uboot-mtk-20220606/board/mediatek/mt7988/bootmenu_emmc.c.orig
rm -f uboot-mtk-20220606/configs/mt7981_360t7_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7981_abt_asr3000_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7981_ax3000t_an8855_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7981_ax3000t_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7981_cetron_ct3003_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7981_cmcc_a10_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7981_cmcc_rax3000m-emmc_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7981_cmcc_rax3000m_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7981_cudy_tr3000-v1_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7981_h3c_magic-nx30-pro_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7981_imou_lc-hx3001_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7981_jcg_q30_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7981_konka_komi-a31_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7981_livinet_zr-3020_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7981_nokia-ea0326gmp_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7981_wr30u_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7986_jdcloud_re-cp-03_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7986_netcore_n60-pro_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7986_netcore_n60_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7986_redmi_ax6000_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7986_tplink_tl-xdr608x_defconfig.orig
rm -f uboot-mtk-20220606/configs/mt7986_tplink_tl-xtr8488_defconfig.orig
rm -f atf-20220606-637ba581b/plat/mediatek/mt7981/drivers/pll/pll.c.orig
rm -f atf-20231013-0ea67d76a/plat/mediatek/mt7981/drivers/pll/pll.c.orig
rm -f uboot-mtk-20230718-09eda825/cmd/glbtn.c.orig
rm -f uboot-mtk-20230718-09eda825/arch/arm/dts/mt7981-ax3000t.dts.orig
rm -f uboot-mtk-20220606/cmd/glbtn.c.orig
rm -f uboot-mtk-20220606/arch/arm/dts/mt7981-ax3000t.dts.orig
rm -f atf-20231013-0ea67d76a/plat/mediatek/mt7981/drivers/pll/pll.c.orig
rm -f atf-20231013-0ea67d76a/plat/mediatek/mt7981/drivers/pll/pll.h.orig
