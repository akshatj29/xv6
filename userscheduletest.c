#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "param.h"
int
main(int argc, char *argv[])
{
 int i;
  i = setpri(getpid(), 20);
  printf(1,"Set Pri = %d", i);
  
  exit();
}
