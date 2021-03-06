MACHINE=`uname -m`
DISTRIB=`lsb_release -i|awk -F ':\t' '{print $2}'`
VERSION=`lsb_release -r|awk -F ':\t' '{print $2}'`
GSTREAM=`gst-inspect-1.0 --version|grep ^GStreamer|awk '{print $2}'`

cd bin
gcc -Wall -O2 \
`pkg-config --cflags glib-2.0` \
`pkg-config --cflags gstreamer-1.0` \
-o gstcam-$MACHINE-$DISTRIB-$VERSION-gst-$GSTREAM ../src/gstcam.c \
`pkg-config --libs glib-2.0` \
`pkg-config --libs gstreamer-1.0`
cd ..
