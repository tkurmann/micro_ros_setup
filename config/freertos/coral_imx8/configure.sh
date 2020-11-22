
EXTENSIONS_DIR=$FW_TARGETDIR/freertos_apps/microros_coral_imx8_extensions

. $PREFIX/config/utils.sh

function help {
      echo "Configure script need an argument."
      echo "   --transport -t       serial or serial-rpmsg"
}

echo $CONFIG_NAME > $FW_TARGETDIR/APP


elif [ "$UROS_TRANSPORT" == "serial" ]; then
      echo "Using serial device USART$UROS_AGENT_DEVICE."

      cp -f $EXTENSIONS_DIR/Src/imx_serial_transport.c $FW_TARGETDIR/mcu_ws/eProsima/Micro-XRCE-DDS-Client/src/c/profile/transport/serial/serial_transport_external.c
      cp -f $EXTENSIONS_DIR/Inc/imx_serial_transport.h $FW_TARGETDIR/mcu_ws/eProsima/Micro-XRCE-DDS-Client/include/uxr/client/profile/transport/serial/serial_transport_external.h
      update_meta "microxrcedds_client" "UCLIENT_EXTERNAL_SERIAL=ON"
      update_meta "microxrcedds_client" "UCLIENT_PROFILE_SERIAL=ON"
      update_meta "microxrcedds_client" "UCLIENT_PROFILE_UDP=OFF"
      update_meta "microxrcedds_client" "UCLIENT_PROFILE_TCP=OFF"

      update_meta "rmw_microxrcedds" "RMW_UXRCE_TRANSPORT=custom_serial"


      remove_meta "rmw_microxrcedds" "RMW_UXRCE_DEFAULT_UDP_IP"
      remove_meta "rmw_microxrcedds" "RMW_UXRCE_DEFAULT_UDP_PORT"

      echo "Configured $UROS_TRANSPORT mode with agent"

elif [ "$UROS_TRANSPORT" == "serial-rpmsg" ]; then
      echo "Using serial RPMSG device. EXPERIMENTAL."

      cp -f $EXTENSIONS_DIR/Src/imx_serial_transport.c $FW_TARGETDIR/mcu_ws/eProsima/Micro-XRCE-DDS-Client/src/c/profile/transport/serial/serial_transport_external.c
      cp -f $EXTENSIONS_DIR/Inc/imx_serial_transport.h $FW_TARGETDIR/mcu_ws/eProsima/Micro-XRCE-DDS-Client/include/uxr/client/profile/transport/serial/serial_transport_external.h
      update_meta "microxrcedds_client" "UCLIENT_EXTERNAL_SERIAL=ON"
      update_meta "rmw_microxrcedds" "RMW_UXRCE_TRANSPORT=custom_serial"

      remove_meta "rmw_microxrcedds" "RMW_UXRCE_DEFAULT_UDP_IP"
      remove_meta "rmw_microxrcedds" "RMW_UXRCE_DEFAULT_UDP_PORT"

      echo "Configured $UROS_TRANSPORT mode with agent"
else
      help
fi
