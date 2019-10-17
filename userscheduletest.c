#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "param.h"
int
main(int argc, char *argv[])
{
 int i;
  i = setpri(getpid(), 2);
  printf(1,"PID: %d, Get Pri = %d, success:%d\n", getpid(), getpri(getpid()),i);
   int cpid = fork2(3);
   if(cpid == 0) {
	   printf(1, "Entered child process\n");
	   printf(1,"Child process pri is: %d\n",getpri(getpid()));
   	   exit();
   }
   else
	   wait();
  // i = getpri(cpid);
printf(1,"CPID: %d",cpid);
  
  exit();
}
