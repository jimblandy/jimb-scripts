set debuginfod enabled on
set print thread-events off

file /home/jimb/rust/wgpu/target/debug/deps/wgpu_test-0c92118afd752936
set args --exact "[Executed] [Vulkan/AMD Radeon Pro WX 3200 Series (RADV POLARIS12)/0] wgpu_test::buffer::map_offset"

set env MALLOC_CHECK_ 1
set env LD_PRELOAD /usr/lib64/libc_malloc_debug.so.0
catch load libc_malloc_debug
command
print mcheck(0)
continue
end

set env WGPU_BACKEND vulkan
set env VK_ICD_FILENAMES /home/jimb/mesa/build/src/gallium/targets/lavapipe/lvp_devenv_icd.x86_64.json
set env VK_LAYER_PATH /home/jimb/Vulkan-ValidationLayers/build/layers

set breakpoint pending on
break _exit
set breakpoint pending off
