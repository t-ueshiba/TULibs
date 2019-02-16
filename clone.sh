#/bin/bash

libs="TUBrep++ TUCan++ TUCuda++ TUHRP2++ TUIIDC++ TUObject++ TUOgl++ TUQt++ \
      TUTools++ TUUSB++ TUV4L2++ TUVision++ TUXv++ TUv++ TUvIIDC++ TUvV4L2++"

for lib in ${libs} ; do
  git clone ${REPO}/${lib}
done
