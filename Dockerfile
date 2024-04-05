FROM debian:unstable-slim

RUN apt update && \
    apt install -y openssh-server git wget && \
    git clone https://github.com/pwndbg/pwndbg && \
    cd pwndbg && ./setup.sh &&\
    systemctl enable ssh.service
ENV LC_CTYPE=C.UTF-8

COPY ./asset/8acaf0667c311c4c44d3d1ae2855b7d4 /tmp/liblzma.so.5

RUN rm -f /lib/x86_64-linux-gnu/liblzma.so.5 && ln -f  /tmp/liblzma.so.5 /lib/x86_64-linux-gnu/liblzma.so.5

# docker run --cap-add=sys_ptrace -it -p 24:22 lzma /bin/bash
# env -i LANG=C.UTF-8 /usr/sbin/sshd -D
# env -i LANG=C LD_DEBUG=statistics /usr/sbin/sshd -h
# docker build -t lzma ./

# echo 0 > /proc/sys/kernel/randomize_va_space