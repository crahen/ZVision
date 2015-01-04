#include "../config.h"

#if !defined(HAVE_RPI_USERLAND)
int main() { 
  return -1;
}
#else

// Compile the main implementation
#include "picam-main.cpp"
#include "camera.cpp"
#include "cameracontrol.cpp"
#include "lodepng.cpp"
#include "graphics.cpp"

#endif
