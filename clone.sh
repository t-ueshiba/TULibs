#/bin/bash

libs="TUBrep TUCan TUCuda TUHRP2 TUIIDC TUObject TUQt \
      TUTools TUUSB TUV4L2 TUVision TUXv TUv TUvIIDC TUvOgl TUvV4L2"

for lib in ${libs} ; do
  git clone ${REPO}/${lib}
done
