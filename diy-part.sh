# diy ATF and u-boot for xiaomi ax3000t based on mt798x

PATCH_FILE="$GITHUB_WORKSPACE/diff.patch"
patch -p1 < "$PATCH_FILE"


b/uboot-mtk-20230718-09eda825/cmd/glbtn.c
