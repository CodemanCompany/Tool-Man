#!/bin/bash
#  ██████╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗
# ██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║
# ██║     ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██╔██╗ ██║
# ██║     ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
# ╚██████╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
#  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
# Extend disk
# https://docs.aws.amazon.com/es_es/AWSEC2/latest/UserGuide/recognize-expanded-volume-linux.html

# Use el comando lsblk para enumerar los dispositivos de bloques adjuntos a la instancia. El siguiente ejemplo muestra tres volúmenes: /dev/xvda, /dev/xvdb y /dev/xvdf.
lsblk

fdisk

# Para un sistema de archivos ext2, ext3 o ext4 de Linux, ejecute el siguiente comando, sustituyendo el nombre del dispositivo que desea ampliar:
resize2fs /dev/xvda1
