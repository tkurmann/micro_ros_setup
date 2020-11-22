CORAL_EXTENSIONS_DIR=$FW_TARGETDIR/freertos_apps/microros_coral_imx8_extensions

pushd $CORAL_EXTENSIONS_DIR > /dev/null

  if [ -f build/micro-ROS.bin ]; then
    echo "Please manually download the .bin file using uboot"

     
  else
    echo "build/micro-ROS.bin not found: please compile before flashing."
  fi

popd > /dev/null

