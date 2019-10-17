
_userscheduletest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "fcntl.h"
#include "param.h"
int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 0c             	sub    $0xc,%esp
 int i;
  i = setpri(getpid(), 2);
  13:	e8 9d 02 00 00       	call   2b5 <getpid>
  18:	83 ec 08             	sub    $0x8,%esp
  1b:	6a 02                	push   $0x2
  1d:	50                   	push   %eax
  1e:	e8 b2 02 00 00       	call   2d5 <setpri>
  23:	89 c6                	mov    %eax,%esi
  printf(1,"PID: %d, Get Pri = %d, success:%d\n", getpid(), getpri(getpid()),i);
  25:	e8 8b 02 00 00       	call   2b5 <getpid>
  2a:	89 04 24             	mov    %eax,(%esp)
  2d:	e8 ab 02 00 00       	call   2dd <getpri>
  32:	89 c3                	mov    %eax,%ebx
  34:	e8 7c 02 00 00       	call   2b5 <getpid>
  39:	89 34 24             	mov    %esi,(%esp)
  3c:	53                   	push   %ebx
  3d:	50                   	push   %eax
  3e:	68 40 06 00 00       	push   $0x640
  43:	6a 01                	push   $0x1
  45:	e8 3d 03 00 00       	call   387 <printf>
   int cpid = fork2(3);
  4a:	83 c4 14             	add    $0x14,%esp
  4d:	6a 03                	push   $0x3
  4f:	e8 91 02 00 00       	call   2e5 <fork2>
   if(cpid == 0) {
  54:	83 c4 10             	add    $0x10,%esp
  57:	85 c0                	test   %eax,%eax
  59:	75 31                	jne    8c <main+0x8c>
	   printf(1, "Entered child process\n");
  5b:	83 ec 08             	sub    $0x8,%esp
  5e:	68 64 06 00 00       	push   $0x664
  63:	6a 01                	push   $0x1
  65:	e8 1d 03 00 00       	call   387 <printf>
	   printf(1,"Child process pri is: %d\n",getpri(getpid()));
  6a:	e8 46 02 00 00       	call   2b5 <getpid>
  6f:	89 04 24             	mov    %eax,(%esp)
  72:	e8 66 02 00 00       	call   2dd <getpri>
  77:	83 c4 0c             	add    $0xc,%esp
  7a:	50                   	push   %eax
  7b:	68 7b 06 00 00       	push   $0x67b
  80:	6a 01                	push   $0x1
  82:	e8 00 03 00 00       	call   387 <printf>
   	   exit();
  87:	e8 a9 01 00 00       	call   235 <exit>
  8c:	89 c3                	mov    %eax,%ebx
   }
   else
	   wait();
  8e:	e8 aa 01 00 00       	call   23d <wait>
  // i = getpri(cpid);
printf(1,"CPID: %d",cpid);
  93:	83 ec 04             	sub    $0x4,%esp
  96:	53                   	push   %ebx
  97:	68 95 06 00 00       	push   $0x695
  9c:	6a 01                	push   $0x1
  9e:	e8 e4 02 00 00       	call   387 <printf>
  
  exit();
  a3:	e8 8d 01 00 00       	call   235 <exit>

000000a8 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  a8:	55                   	push   %ebp
  a9:	89 e5                	mov    %esp,%ebp
  ab:	53                   	push   %ebx
  ac:	8b 45 08             	mov    0x8(%ebp),%eax
  af:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  b2:	89 c2                	mov    %eax,%edx
  b4:	0f b6 19             	movzbl (%ecx),%ebx
  b7:	88 1a                	mov    %bl,(%edx)
  b9:	8d 52 01             	lea    0x1(%edx),%edx
  bc:	8d 49 01             	lea    0x1(%ecx),%ecx
  bf:	84 db                	test   %bl,%bl
  c1:	75 f1                	jne    b4 <strcpy+0xc>
    ;
  return os;
}
  c3:	5b                   	pop    %ebx
  c4:	5d                   	pop    %ebp
  c5:	c3                   	ret    

000000c6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c6:	55                   	push   %ebp
  c7:	89 e5                	mov    %esp,%ebp
  c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  cc:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  cf:	eb 06                	jmp    d7 <strcmp+0x11>
    p++, q++;
  d1:	83 c1 01             	add    $0x1,%ecx
  d4:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  d7:	0f b6 01             	movzbl (%ecx),%eax
  da:	84 c0                	test   %al,%al
  dc:	74 04                	je     e2 <strcmp+0x1c>
  de:	3a 02                	cmp    (%edx),%al
  e0:	74 ef                	je     d1 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  e2:	0f b6 c0             	movzbl %al,%eax
  e5:	0f b6 12             	movzbl (%edx),%edx
  e8:	29 d0                	sub    %edx,%eax
}
  ea:	5d                   	pop    %ebp
  eb:	c3                   	ret    

000000ec <strlen>:

uint
strlen(const char *s)
{
  ec:	55                   	push   %ebp
  ed:	89 e5                	mov    %esp,%ebp
  ef:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  f2:	ba 00 00 00 00       	mov    $0x0,%edx
  f7:	eb 03                	jmp    fc <strlen+0x10>
  f9:	83 c2 01             	add    $0x1,%edx
  fc:	89 d0                	mov    %edx,%eax
  fe:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 102:	75 f5                	jne    f9 <strlen+0xd>
    ;
  return n;
}
 104:	5d                   	pop    %ebp
 105:	c3                   	ret    

00000106 <memset>:

void*
memset(void *dst, int c, uint n)
{
 106:	55                   	push   %ebp
 107:	89 e5                	mov    %esp,%ebp
 109:	57                   	push   %edi
 10a:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 10d:	89 d7                	mov    %edx,%edi
 10f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 112:	8b 45 0c             	mov    0xc(%ebp),%eax
 115:	fc                   	cld    
 116:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 118:	89 d0                	mov    %edx,%eax
 11a:	5f                   	pop    %edi
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    

0000011d <strchr>:

char*
strchr(const char *s, char c)
{
 11d:	55                   	push   %ebp
 11e:	89 e5                	mov    %esp,%ebp
 120:	8b 45 08             	mov    0x8(%ebp),%eax
 123:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 127:	0f b6 10             	movzbl (%eax),%edx
 12a:	84 d2                	test   %dl,%dl
 12c:	74 09                	je     137 <strchr+0x1a>
    if(*s == c)
 12e:	38 ca                	cmp    %cl,%dl
 130:	74 0a                	je     13c <strchr+0x1f>
  for(; *s; s++)
 132:	83 c0 01             	add    $0x1,%eax
 135:	eb f0                	jmp    127 <strchr+0xa>
      return (char*)s;
  return 0;
 137:	b8 00 00 00 00       	mov    $0x0,%eax
}
 13c:	5d                   	pop    %ebp
 13d:	c3                   	ret    

0000013e <gets>:

char*
gets(char *buf, int max)
{
 13e:	55                   	push   %ebp
 13f:	89 e5                	mov    %esp,%ebp
 141:	57                   	push   %edi
 142:	56                   	push   %esi
 143:	53                   	push   %ebx
 144:	83 ec 1c             	sub    $0x1c,%esp
 147:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 14a:	bb 00 00 00 00       	mov    $0x0,%ebx
 14f:	8d 73 01             	lea    0x1(%ebx),%esi
 152:	3b 75 0c             	cmp    0xc(%ebp),%esi
 155:	7d 2e                	jge    185 <gets+0x47>
    cc = read(0, &c, 1);
 157:	83 ec 04             	sub    $0x4,%esp
 15a:	6a 01                	push   $0x1
 15c:	8d 45 e7             	lea    -0x19(%ebp),%eax
 15f:	50                   	push   %eax
 160:	6a 00                	push   $0x0
 162:	e8 e6 00 00 00       	call   24d <read>
    if(cc < 1)
 167:	83 c4 10             	add    $0x10,%esp
 16a:	85 c0                	test   %eax,%eax
 16c:	7e 17                	jle    185 <gets+0x47>
      break;
    buf[i++] = c;
 16e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 172:	88 04 1f             	mov    %al,(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 175:	3c 0a                	cmp    $0xa,%al
 177:	0f 94 c2             	sete   %dl
 17a:	3c 0d                	cmp    $0xd,%al
 17c:	0f 94 c0             	sete   %al
    buf[i++] = c;
 17f:	89 f3                	mov    %esi,%ebx
    if(c == '\n' || c == '\r')
 181:	08 c2                	or     %al,%dl
 183:	74 ca                	je     14f <gets+0x11>
      break;
  }
  buf[i] = '\0';
 185:	c6 04 1f 00          	movb   $0x0,(%edi,%ebx,1)
  return buf;
}
 189:	89 f8                	mov    %edi,%eax
 18b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 18e:	5b                   	pop    %ebx
 18f:	5e                   	pop    %esi
 190:	5f                   	pop    %edi
 191:	5d                   	pop    %ebp
 192:	c3                   	ret    

00000193 <stat>:

int
stat(const char *n, struct stat *st)
{
 193:	55                   	push   %ebp
 194:	89 e5                	mov    %esp,%ebp
 196:	56                   	push   %esi
 197:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 198:	83 ec 08             	sub    $0x8,%esp
 19b:	6a 00                	push   $0x0
 19d:	ff 75 08             	pushl  0x8(%ebp)
 1a0:	e8 d0 00 00 00       	call   275 <open>
  if(fd < 0)
 1a5:	83 c4 10             	add    $0x10,%esp
 1a8:	85 c0                	test   %eax,%eax
 1aa:	78 24                	js     1d0 <stat+0x3d>
 1ac:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1ae:	83 ec 08             	sub    $0x8,%esp
 1b1:	ff 75 0c             	pushl  0xc(%ebp)
 1b4:	50                   	push   %eax
 1b5:	e8 d3 00 00 00       	call   28d <fstat>
 1ba:	89 c6                	mov    %eax,%esi
  close(fd);
 1bc:	89 1c 24             	mov    %ebx,(%esp)
 1bf:	e8 99 00 00 00       	call   25d <close>
  return r;
 1c4:	83 c4 10             	add    $0x10,%esp
}
 1c7:	89 f0                	mov    %esi,%eax
 1c9:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1cc:	5b                   	pop    %ebx
 1cd:	5e                   	pop    %esi
 1ce:	5d                   	pop    %ebp
 1cf:	c3                   	ret    
    return -1;
 1d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1d5:	eb f0                	jmp    1c7 <stat+0x34>

000001d7 <atoi>:

int
atoi(const char *s)
{
 1d7:	55                   	push   %ebp
 1d8:	89 e5                	mov    %esp,%ebp
 1da:	53                   	push   %ebx
 1db:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 1de:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 1e3:	eb 10                	jmp    1f5 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 1e5:	8d 1c 80             	lea    (%eax,%eax,4),%ebx
 1e8:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
 1eb:	83 c1 01             	add    $0x1,%ecx
 1ee:	0f be d2             	movsbl %dl,%edx
 1f1:	8d 44 02 d0          	lea    -0x30(%edx,%eax,1),%eax
  while('0' <= *s && *s <= '9')
 1f5:	0f b6 11             	movzbl (%ecx),%edx
 1f8:	8d 5a d0             	lea    -0x30(%edx),%ebx
 1fb:	80 fb 09             	cmp    $0x9,%bl
 1fe:	76 e5                	jbe    1e5 <atoi+0xe>
  return n;
}
 200:	5b                   	pop    %ebx
 201:	5d                   	pop    %ebp
 202:	c3                   	ret    

00000203 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 203:	55                   	push   %ebp
 204:	89 e5                	mov    %esp,%ebp
 206:	56                   	push   %esi
 207:	53                   	push   %ebx
 208:	8b 45 08             	mov    0x8(%ebp),%eax
 20b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 20e:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
 211:	89 c1                	mov    %eax,%ecx
  src = vsrc;
  while(n-- > 0)
 213:	eb 0d                	jmp    222 <memmove+0x1f>
    *dst++ = *src++;
 215:	0f b6 13             	movzbl (%ebx),%edx
 218:	88 11                	mov    %dl,(%ecx)
 21a:	8d 5b 01             	lea    0x1(%ebx),%ebx
 21d:	8d 49 01             	lea    0x1(%ecx),%ecx
  while(n-- > 0)
 220:	89 f2                	mov    %esi,%edx
 222:	8d 72 ff             	lea    -0x1(%edx),%esi
 225:	85 d2                	test   %edx,%edx
 227:	7f ec                	jg     215 <memmove+0x12>
  return vdst;
}
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    

0000022d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 22d:	b8 01 00 00 00       	mov    $0x1,%eax
 232:	cd 40                	int    $0x40
 234:	c3                   	ret    

00000235 <exit>:
SYSCALL(exit)
 235:	b8 02 00 00 00       	mov    $0x2,%eax
 23a:	cd 40                	int    $0x40
 23c:	c3                   	ret    

0000023d <wait>:
SYSCALL(wait)
 23d:	b8 03 00 00 00       	mov    $0x3,%eax
 242:	cd 40                	int    $0x40
 244:	c3                   	ret    

00000245 <pipe>:
SYSCALL(pipe)
 245:	b8 04 00 00 00       	mov    $0x4,%eax
 24a:	cd 40                	int    $0x40
 24c:	c3                   	ret    

0000024d <read>:
SYSCALL(read)
 24d:	b8 05 00 00 00       	mov    $0x5,%eax
 252:	cd 40                	int    $0x40
 254:	c3                   	ret    

00000255 <write>:
SYSCALL(write)
 255:	b8 10 00 00 00       	mov    $0x10,%eax
 25a:	cd 40                	int    $0x40
 25c:	c3                   	ret    

0000025d <close>:
SYSCALL(close)
 25d:	b8 15 00 00 00       	mov    $0x15,%eax
 262:	cd 40                	int    $0x40
 264:	c3                   	ret    

00000265 <kill>:
SYSCALL(kill)
 265:	b8 06 00 00 00       	mov    $0x6,%eax
 26a:	cd 40                	int    $0x40
 26c:	c3                   	ret    

0000026d <exec>:
SYSCALL(exec)
 26d:	b8 07 00 00 00       	mov    $0x7,%eax
 272:	cd 40                	int    $0x40
 274:	c3                   	ret    

00000275 <open>:
SYSCALL(open)
 275:	b8 0f 00 00 00       	mov    $0xf,%eax
 27a:	cd 40                	int    $0x40
 27c:	c3                   	ret    

0000027d <mknod>:
SYSCALL(mknod)
 27d:	b8 11 00 00 00       	mov    $0x11,%eax
 282:	cd 40                	int    $0x40
 284:	c3                   	ret    

00000285 <unlink>:
SYSCALL(unlink)
 285:	b8 12 00 00 00       	mov    $0x12,%eax
 28a:	cd 40                	int    $0x40
 28c:	c3                   	ret    

0000028d <fstat>:
SYSCALL(fstat)
 28d:	b8 08 00 00 00       	mov    $0x8,%eax
 292:	cd 40                	int    $0x40
 294:	c3                   	ret    

00000295 <link>:
SYSCALL(link)
 295:	b8 13 00 00 00       	mov    $0x13,%eax
 29a:	cd 40                	int    $0x40
 29c:	c3                   	ret    

0000029d <mkdir>:
SYSCALL(mkdir)
 29d:	b8 14 00 00 00       	mov    $0x14,%eax
 2a2:	cd 40                	int    $0x40
 2a4:	c3                   	ret    

000002a5 <chdir>:
SYSCALL(chdir)
 2a5:	b8 09 00 00 00       	mov    $0x9,%eax
 2aa:	cd 40                	int    $0x40
 2ac:	c3                   	ret    

000002ad <dup>:
SYSCALL(dup)
 2ad:	b8 0a 00 00 00       	mov    $0xa,%eax
 2b2:	cd 40                	int    $0x40
 2b4:	c3                   	ret    

000002b5 <getpid>:
SYSCALL(getpid)
 2b5:	b8 0b 00 00 00       	mov    $0xb,%eax
 2ba:	cd 40                	int    $0x40
 2bc:	c3                   	ret    

000002bd <sbrk>:
SYSCALL(sbrk)
 2bd:	b8 0c 00 00 00       	mov    $0xc,%eax
 2c2:	cd 40                	int    $0x40
 2c4:	c3                   	ret    

000002c5 <sleep>:
SYSCALL(sleep)
 2c5:	b8 0d 00 00 00       	mov    $0xd,%eax
 2ca:	cd 40                	int    $0x40
 2cc:	c3                   	ret    

000002cd <uptime>:
SYSCALL(uptime)
 2cd:	b8 0e 00 00 00       	mov    $0xe,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <setpri>:
SYSCALL(setpri)
 2d5:	b8 16 00 00 00       	mov    $0x16,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <getpri>:
SYSCALL(getpri)
 2dd:	b8 17 00 00 00       	mov    $0x17,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <fork2>:
SYSCALL(fork2)
 2e5:	b8 18 00 00 00       	mov    $0x18,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 2ed:	55                   	push   %ebp
 2ee:	89 e5                	mov    %esp,%ebp
 2f0:	83 ec 1c             	sub    $0x1c,%esp
 2f3:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 2f6:	6a 01                	push   $0x1
 2f8:	8d 55 f4             	lea    -0xc(%ebp),%edx
 2fb:	52                   	push   %edx
 2fc:	50                   	push   %eax
 2fd:	e8 53 ff ff ff       	call   255 <write>
}
 302:	83 c4 10             	add    $0x10,%esp
 305:	c9                   	leave  
 306:	c3                   	ret    

00000307 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 307:	55                   	push   %ebp
 308:	89 e5                	mov    %esp,%ebp
 30a:	57                   	push   %edi
 30b:	56                   	push   %esi
 30c:	53                   	push   %ebx
 30d:	83 ec 2c             	sub    $0x2c,%esp
 310:	89 c7                	mov    %eax,%edi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 312:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 316:	0f 95 c3             	setne  %bl
 319:	89 d0                	mov    %edx,%eax
 31b:	c1 e8 1f             	shr    $0x1f,%eax
 31e:	84 c3                	test   %al,%bl
 320:	74 10                	je     332 <printint+0x2b>
    neg = 1;
    x = -xx;
 322:	f7 da                	neg    %edx
    neg = 1;
 324:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 32b:	be 00 00 00 00       	mov    $0x0,%esi
 330:	eb 0b                	jmp    33d <printint+0x36>
  neg = 0;
 332:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 339:	eb f0                	jmp    32b <printint+0x24>
  do{
    buf[i++] = digits[x % base];
 33b:	89 c6                	mov    %eax,%esi
 33d:	89 d0                	mov    %edx,%eax
 33f:	ba 00 00 00 00       	mov    $0x0,%edx
 344:	f7 f1                	div    %ecx
 346:	89 c3                	mov    %eax,%ebx
 348:	8d 46 01             	lea    0x1(%esi),%eax
 34b:	0f b6 92 a8 06 00 00 	movzbl 0x6a8(%edx),%edx
 352:	88 54 35 d8          	mov    %dl,-0x28(%ebp,%esi,1)
  }while((x /= base) != 0);
 356:	89 da                	mov    %ebx,%edx
 358:	85 db                	test   %ebx,%ebx
 35a:	75 df                	jne    33b <printint+0x34>
 35c:	89 c3                	mov    %eax,%ebx
  if(neg)
 35e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 362:	74 16                	je     37a <printint+0x73>
    buf[i++] = '-';
 364:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)
 369:	8d 5e 02             	lea    0x2(%esi),%ebx
 36c:	eb 0c                	jmp    37a <printint+0x73>

  while(--i >= 0)
    putc(fd, buf[i]);
 36e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 373:	89 f8                	mov    %edi,%eax
 375:	e8 73 ff ff ff       	call   2ed <putc>
  while(--i >= 0)
 37a:	83 eb 01             	sub    $0x1,%ebx
 37d:	79 ef                	jns    36e <printint+0x67>
}
 37f:	83 c4 2c             	add    $0x2c,%esp
 382:	5b                   	pop    %ebx
 383:	5e                   	pop    %esi
 384:	5f                   	pop    %edi
 385:	5d                   	pop    %ebp
 386:	c3                   	ret    

00000387 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 387:	55                   	push   %ebp
 388:	89 e5                	mov    %esp,%ebp
 38a:	57                   	push   %edi
 38b:	56                   	push   %esi
 38c:	53                   	push   %ebx
 38d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 390:	8d 45 10             	lea    0x10(%ebp),%eax
 393:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 396:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 39b:	bb 00 00 00 00       	mov    $0x0,%ebx
 3a0:	eb 14                	jmp    3b6 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3a2:	89 fa                	mov    %edi,%edx
 3a4:	8b 45 08             	mov    0x8(%ebp),%eax
 3a7:	e8 41 ff ff ff       	call   2ed <putc>
 3ac:	eb 05                	jmp    3b3 <printf+0x2c>
      }
    } else if(state == '%'){
 3ae:	83 fe 25             	cmp    $0x25,%esi
 3b1:	74 25                	je     3d8 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 3b3:	83 c3 01             	add    $0x1,%ebx
 3b6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b9:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 3bd:	84 c0                	test   %al,%al
 3bf:	0f 84 23 01 00 00    	je     4e8 <printf+0x161>
    c = fmt[i] & 0xff;
 3c5:	0f be f8             	movsbl %al,%edi
 3c8:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 3cb:	85 f6                	test   %esi,%esi
 3cd:	75 df                	jne    3ae <printf+0x27>
      if(c == '%'){
 3cf:	83 f8 25             	cmp    $0x25,%eax
 3d2:	75 ce                	jne    3a2 <printf+0x1b>
        state = '%';
 3d4:	89 c6                	mov    %eax,%esi
 3d6:	eb db                	jmp    3b3 <printf+0x2c>
      if(c == 'd'){
 3d8:	83 f8 64             	cmp    $0x64,%eax
 3db:	74 49                	je     426 <printf+0x9f>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 3dd:	83 f8 78             	cmp    $0x78,%eax
 3e0:	0f 94 c1             	sete   %cl
 3e3:	83 f8 70             	cmp    $0x70,%eax
 3e6:	0f 94 c2             	sete   %dl
 3e9:	08 d1                	or     %dl,%cl
 3eb:	75 63                	jne    450 <printf+0xc9>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 3ed:	83 f8 73             	cmp    $0x73,%eax
 3f0:	0f 84 84 00 00 00    	je     47a <printf+0xf3>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 3f6:	83 f8 63             	cmp    $0x63,%eax
 3f9:	0f 84 b7 00 00 00    	je     4b6 <printf+0x12f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 3ff:	83 f8 25             	cmp    $0x25,%eax
 402:	0f 84 cc 00 00 00    	je     4d4 <printf+0x14d>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 408:	ba 25 00 00 00       	mov    $0x25,%edx
 40d:	8b 45 08             	mov    0x8(%ebp),%eax
 410:	e8 d8 fe ff ff       	call   2ed <putc>
        putc(fd, c);
 415:	89 fa                	mov    %edi,%edx
 417:	8b 45 08             	mov    0x8(%ebp),%eax
 41a:	e8 ce fe ff ff       	call   2ed <putc>
      }
      state = 0;
 41f:	be 00 00 00 00       	mov    $0x0,%esi
 424:	eb 8d                	jmp    3b3 <printf+0x2c>
        printint(fd, *ap, 10, 1);
 426:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 429:	8b 17                	mov    (%edi),%edx
 42b:	83 ec 0c             	sub    $0xc,%esp
 42e:	6a 01                	push   $0x1
 430:	b9 0a 00 00 00       	mov    $0xa,%ecx
 435:	8b 45 08             	mov    0x8(%ebp),%eax
 438:	e8 ca fe ff ff       	call   307 <printint>
        ap++;
 43d:	83 c7 04             	add    $0x4,%edi
 440:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 443:	83 c4 10             	add    $0x10,%esp
      state = 0;
 446:	be 00 00 00 00       	mov    $0x0,%esi
 44b:	e9 63 ff ff ff       	jmp    3b3 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 450:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 453:	8b 17                	mov    (%edi),%edx
 455:	83 ec 0c             	sub    $0xc,%esp
 458:	6a 00                	push   $0x0
 45a:	b9 10 00 00 00       	mov    $0x10,%ecx
 45f:	8b 45 08             	mov    0x8(%ebp),%eax
 462:	e8 a0 fe ff ff       	call   307 <printint>
        ap++;
 467:	83 c7 04             	add    $0x4,%edi
 46a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 46d:	83 c4 10             	add    $0x10,%esp
      state = 0;
 470:	be 00 00 00 00       	mov    $0x0,%esi
 475:	e9 39 ff ff ff       	jmp    3b3 <printf+0x2c>
        s = (char*)*ap;
 47a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 47d:	8b 30                	mov    (%eax),%esi
        ap++;
 47f:	83 c0 04             	add    $0x4,%eax
 482:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 485:	85 f6                	test   %esi,%esi
 487:	75 28                	jne    4b1 <printf+0x12a>
          s = "(null)";
 489:	be 9e 06 00 00       	mov    $0x69e,%esi
 48e:	8b 7d 08             	mov    0x8(%ebp),%edi
 491:	eb 0d                	jmp    4a0 <printf+0x119>
          putc(fd, *s);
 493:	0f be d2             	movsbl %dl,%edx
 496:	89 f8                	mov    %edi,%eax
 498:	e8 50 fe ff ff       	call   2ed <putc>
          s++;
 49d:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4a0:	0f b6 16             	movzbl (%esi),%edx
 4a3:	84 d2                	test   %dl,%dl
 4a5:	75 ec                	jne    493 <printf+0x10c>
      state = 0;
 4a7:	be 00 00 00 00       	mov    $0x0,%esi
 4ac:	e9 02 ff ff ff       	jmp    3b3 <printf+0x2c>
 4b1:	8b 7d 08             	mov    0x8(%ebp),%edi
 4b4:	eb ea                	jmp    4a0 <printf+0x119>
        putc(fd, *ap);
 4b6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4b9:	0f be 17             	movsbl (%edi),%edx
 4bc:	8b 45 08             	mov    0x8(%ebp),%eax
 4bf:	e8 29 fe ff ff       	call   2ed <putc>
        ap++;
 4c4:	83 c7 04             	add    $0x4,%edi
 4c7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4ca:	be 00 00 00 00       	mov    $0x0,%esi
 4cf:	e9 df fe ff ff       	jmp    3b3 <printf+0x2c>
        putc(fd, c);
 4d4:	89 fa                	mov    %edi,%edx
 4d6:	8b 45 08             	mov    0x8(%ebp),%eax
 4d9:	e8 0f fe ff ff       	call   2ed <putc>
      state = 0;
 4de:	be 00 00 00 00       	mov    $0x0,%esi
 4e3:	e9 cb fe ff ff       	jmp    3b3 <printf+0x2c>
    }
  }
}
 4e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4eb:	5b                   	pop    %ebx
 4ec:	5e                   	pop    %esi
 4ed:	5f                   	pop    %edi
 4ee:	5d                   	pop    %ebp
 4ef:	c3                   	ret    

000004f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
 4f5:	53                   	push   %ebx
 4f6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 4f9:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 4fc:	a1 48 09 00 00       	mov    0x948,%eax
 501:	eb 02                	jmp    505 <free+0x15>
 503:	89 d0                	mov    %edx,%eax
 505:	39 c8                	cmp    %ecx,%eax
 507:	73 04                	jae    50d <free+0x1d>
 509:	39 08                	cmp    %ecx,(%eax)
 50b:	77 12                	ja     51f <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 50d:	8b 10                	mov    (%eax),%edx
 50f:	39 c2                	cmp    %eax,%edx
 511:	77 f0                	ja     503 <free+0x13>
 513:	39 c8                	cmp    %ecx,%eax
 515:	72 08                	jb     51f <free+0x2f>
 517:	39 ca                	cmp    %ecx,%edx
 519:	77 04                	ja     51f <free+0x2f>
 51b:	89 d0                	mov    %edx,%eax
 51d:	eb e6                	jmp    505 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 51f:	8b 73 fc             	mov    -0x4(%ebx),%esi
 522:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 525:	8b 10                	mov    (%eax),%edx
 527:	39 d7                	cmp    %edx,%edi
 529:	74 19                	je     544 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 52b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 52e:	8b 50 04             	mov    0x4(%eax),%edx
 531:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 534:	39 ce                	cmp    %ecx,%esi
 536:	74 1b                	je     553 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 538:	89 08                	mov    %ecx,(%eax)
  freep = p;
 53a:	a3 48 09 00 00       	mov    %eax,0x948
}
 53f:	5b                   	pop    %ebx
 540:	5e                   	pop    %esi
 541:	5f                   	pop    %edi
 542:	5d                   	pop    %ebp
 543:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 544:	03 72 04             	add    0x4(%edx),%esi
 547:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 54a:	8b 10                	mov    (%eax),%edx
 54c:	8b 12                	mov    (%edx),%edx
 54e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 551:	eb db                	jmp    52e <free+0x3e>
    p->s.size += bp->s.size;
 553:	03 53 fc             	add    -0x4(%ebx),%edx
 556:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 559:	8b 53 f8             	mov    -0x8(%ebx),%edx
 55c:	89 10                	mov    %edx,(%eax)
 55e:	eb da                	jmp    53a <free+0x4a>

00000560 <morecore>:

static Header*
morecore(uint nu)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	53                   	push   %ebx
 564:	83 ec 04             	sub    $0x4,%esp
 567:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 569:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 56e:	77 05                	ja     575 <morecore+0x15>
    nu = 4096;
 570:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 575:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 57c:	83 ec 0c             	sub    $0xc,%esp
 57f:	50                   	push   %eax
 580:	e8 38 fd ff ff       	call   2bd <sbrk>
  if(p == (char*)-1)
 585:	83 c4 10             	add    $0x10,%esp
 588:	83 f8 ff             	cmp    $0xffffffff,%eax
 58b:	74 1c                	je     5a9 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 58d:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 590:	83 c0 08             	add    $0x8,%eax
 593:	83 ec 0c             	sub    $0xc,%esp
 596:	50                   	push   %eax
 597:	e8 54 ff ff ff       	call   4f0 <free>
  return freep;
 59c:	a1 48 09 00 00       	mov    0x948,%eax
 5a1:	83 c4 10             	add    $0x10,%esp
}
 5a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5a7:	c9                   	leave  
 5a8:	c3                   	ret    
    return 0;
 5a9:	b8 00 00 00 00       	mov    $0x0,%eax
 5ae:	eb f4                	jmp    5a4 <morecore+0x44>

000005b0 <malloc>:

void*
malloc(uint nbytes)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	53                   	push   %ebx
 5b4:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5b7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ba:	8d 58 07             	lea    0x7(%eax),%ebx
 5bd:	c1 eb 03             	shr    $0x3,%ebx
 5c0:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 5c3:	8b 0d 48 09 00 00    	mov    0x948,%ecx
 5c9:	85 c9                	test   %ecx,%ecx
 5cb:	74 04                	je     5d1 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5cd:	8b 01                	mov    (%ecx),%eax
 5cf:	eb 4d                	jmp    61e <malloc+0x6e>
    base.s.ptr = freep = prevp = &base;
 5d1:	c7 05 48 09 00 00 4c 	movl   $0x94c,0x948
 5d8:	09 00 00 
 5db:	c7 05 4c 09 00 00 4c 	movl   $0x94c,0x94c
 5e2:	09 00 00 
    base.s.size = 0;
 5e5:	c7 05 50 09 00 00 00 	movl   $0x0,0x950
 5ec:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 5ef:	b9 4c 09 00 00       	mov    $0x94c,%ecx
 5f4:	eb d7                	jmp    5cd <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 5f6:	39 da                	cmp    %ebx,%edx
 5f8:	74 1a                	je     614 <malloc+0x64>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 5fa:	29 da                	sub    %ebx,%edx
 5fc:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 5ff:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 602:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 605:	89 0d 48 09 00 00    	mov    %ecx,0x948
      return (void*)(p + 1);
 60b:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 60e:	83 c4 04             	add    $0x4,%esp
 611:	5b                   	pop    %ebx
 612:	5d                   	pop    %ebp
 613:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 614:	8b 10                	mov    (%eax),%edx
 616:	89 11                	mov    %edx,(%ecx)
 618:	eb eb                	jmp    605 <malloc+0x55>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 61a:	89 c1                	mov    %eax,%ecx
 61c:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 61e:	8b 50 04             	mov    0x4(%eax),%edx
 621:	39 da                	cmp    %ebx,%edx
 623:	73 d1                	jae    5f6 <malloc+0x46>
    if(p == freep)
 625:	39 05 48 09 00 00    	cmp    %eax,0x948
 62b:	75 ed                	jne    61a <malloc+0x6a>
      if((p = morecore(nunits)) == 0)
 62d:	89 d8                	mov    %ebx,%eax
 62f:	e8 2c ff ff ff       	call   560 <morecore>
 634:	85 c0                	test   %eax,%eax
 636:	75 e2                	jne    61a <malloc+0x6a>
        return 0;
 638:	b8 00 00 00 00       	mov    $0x0,%eax
 63d:	eb cf                	jmp    60e <malloc+0x5e>
