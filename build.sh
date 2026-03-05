# make V=1 clean
export CONFIG_KSU=y
export CONFIG_KSU_MANUAL_HOOK=y
export CONFIG_KSU_MANUAL_HOOK_AUTO_SETUID_HOOK=y
export CONFIG_KSU_MANUAL_HOOK_AUTO_INITRC_HOOK=y
export CONFIG_KSU_MANUAL_HOOK_AUTO_INPUT_HOOK=y

rm -rfv out
make LLVM=1 LLVM_IAS=1 vince-perf_defconfig
make LLVM=1 LLVM_IAS=1 -j8
cp -v out/arch/arm64/boot/Image.gz-dtb AnyKernel3
cd AnyKernel3
bash ../pack.sh
cd ..
