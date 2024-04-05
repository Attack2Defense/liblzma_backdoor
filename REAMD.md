
## run

gdb /usr/sbin/sshd
set args -D
set environment LANG=C.UTF-8

ssh -i ~/.ssh/id_rsa.pub root@127.0.0.1 -p 24 


```
mkdir -p /run/sshd
chmod 0755 /run/sshd
env -i LANG=C.UTF-8 /usr/sbin/sshd -D
```

## debug 

```
gdb /usr/sbin/sshd
set args -D
unset env 
set env LANG=C.UTF-8
show env 
```


# address

watch *0x7FFFF7409008
watch _rtld_global_ro._dl_naudit

0x7ffff73ce000     0x7ffff73d1000 r--p     3000      0 /usr/lib/x86_64-linux-gnu/liblzma.so.5                                   
0x7ffff73d1000     0x7ffff73fb000 r-xp    2a000   3000 /usr/lib/x86_64-linux-gnu/liblzma.so.5                                   
0x7ffff73fb000     0x7ffff7408000 r--p     d000  2d000 /usr/lib/x86_64-linux-gnu/liblzma.so.5                                   
0x7ffff7408000     0x7ffff7409000 r--p     1000  3a000 /usr/lib/x86_64-linux-gnu/liblzma.so.5 


disass   0x7ffff73d1d44,0x7FFFF73D1DAB 
got of RSA_public_decrypt_ptr : 0x55555565C208

backdoor_start: 0x7FFFF73D1CD0
backdoor_init: 0x7FFFF73F3140




初始化了一个什么玩意；；

00:0000│ rdi r8 0x7fffffffe8a0 —▸ 0x7ffff7403510 ◂— 0x0
01:0008│-038    0x7fffffffe8a8 —▸ 0x7ffff7408cd8 ◂— 0x3aa88
02:0010│-030    0x7fffffffe8b0 —▸ 0x7ffff7408fe0 —▸ 0x7ffff73d1cb0 ◂— endbr64 
03:0018│-028    0x7fffffffe8b8 ◂— 0x308
04:0020│-020    0x7fffffffe8c0 ◂— 0xffffffffffffa838
05:0028│-018    0x7fffffffe8c8 —▸ 0x7ffff7fd9fab (_dl_relocate_object+4107) ◂— mov r10, qword ptr [rbp - 0xf8]
06:0030│-010    0x7fffffffe8d0 ◂— 0x7
07:0038│-008    0x7fffffffe8d8 ◂— 0x1


不知道是啥 .....
0x00007FFFF73FD260

## ref

https://www.openwall.com/lists/oss-security/2024/03/29/4
https://twitter.com/matrosov/status/1774247809858060513
https://aliyuque.antfin.com/caobo.cao/ptta9p/xaqhugkk24tkols5?singleDoc#
https://mp.weixin.qq.com/s/bZHavV6IF_W4QALhcbpwtw
https://mp.weixin.qq.com/s/olc8OpJ75afK5wMWY2R02Q
https://mp.weixin.qq.com/s/KzIhfGwKygcKUrlN42dv-Q
https://github.com/amlweems/xzbot
https://gist.github.com/smx-smx/a6112d54777845d389bd7126d6e9f504
https://mp.weixin.qq.com/s/4ju-aG027mFJC2r9HbCaPQ
https://mp.weixin.qq.com/s/rq4DI1Pw9AeZKvY3qlwSQw
https://mp.weixin.qq.com/s/BeTTJ0Fns4foKggxki77qA