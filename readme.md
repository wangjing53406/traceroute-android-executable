## traceroute-android-executable

---

traceroute-android-executable frok from [https://sourceforge.net/projects/traceroute/files/](https://sourceforge.net/projects/traceroute/files/)，you can visit [http://traceroute.sourceforge.net/](http://traceroute.sourceforge.net/) for more details.

### what's traceroute

Traceroute tracks the route packets taken from an IP network on their way to a given host. It utilizes the IP protocol's time to live (TTL) field and attempts to elicit an ICMP TIME_EXCEEDED response from each gateway along the path to the host. See traceroute(8) in the manual of your system for more info.

It is well-known application, appeared long time ago. Since 2000, its initial implementation is not developed, and does not follow the modern network needs. There was already some attempts to continue or re-write it, or to create similar application with additional features, but mostly such works either provides things partially or have considerably different interface.

This code was written from the scratch, using some ideas of Olaf Kirch's traceroute, the original implementation of Van Jacobson and some current BSD's ones. It is fully compatible with the original traceroute from Van Jacobson, wide used before for years.

**Note**, that this implementation is intended for Linux only. It utilizes some currently Linux-specific features (including MSG_ERRQUEUE for recvmsg(2)), which allow such things like the use by unprivileged users (without setuid bit) for some type of tracerouting. The Linux kernel 2.6 or higher required.

### Main features:

- Command line and output compatible with the original traceroute
- Full support for both IPv4 and IPv6 protocols
- Ability to send several probe packets at a time (most cases much faster results)
- Several tracerouting methods, including
   * UDP datagrams (including udplite and udp to particlular port)
   * ICMP ECHO packets
   * TCP SYN requests (in general, any TCP request with various flags and options)
   * Generic IP datagrams
- UDP methods do not require root privileges
- Performing AS path lookups for returned addresses
- Showing of ICMP extensions, including MPLS
- Wrappers for tcptraceroute and others
- and much more, see traceroute(8)

### how to build with ndk-build

1.download [Android NDK](https://developer.android.google.cn/ndk/downloads/)

2.add NDK_HOME to your environment variables file  

for mac user

> vim ~/.bash_profile

for linux user

> vim ~/.bash_rc

```
export ANDROID_HOME=~/Library/Android/sdk
export NDK_HOME=${ANDROID_HOME}/ndk-bundle
export PATH=${PATH}:${NDK_HOME}
```

then source environment variables file

> source ~/.bash_profile 

> source ~/.bash_rc

3.clone project

> git clone git@github.com:wangjing53406/traceroute-android-executable.git

4.use build script to build

> cd traceroute-android-executable

> ./build.sh

### traceroute sample

on the android result:

```
HWCOL:/data/data/com.**.** $ ./traceroute www.google.com
traceroute to www.google.com (199.59.148.209), 30 hops max, 60 byte packets
 1  bogon (172.16.32.1)  2.534 ms  2.519 ms  5.096 ms
 2  bogon (10.10.10.1)  5.208 ms  4.526 ms  4.979 ms
 3  * * *
 4  bogon (10.0.12.141)  5.133 ms  4.817 ms  4.265 ms
 5  bogon (10.0.12.230)  4.427 ms  5.010 ms  6.368 ms
 6  124.65.242.98 (124.65.242.98)  43.360 ms  38.183 ms  37.547 ms
 7  * * *
 8  61.51.112.21 (61.51.112.21)  14.483 ms  15.009 ms  14.111 ms
 9  123.126.7.141 (123.126.7.141)  26.295 ms * 61.148.156.65 (61.148.156.65)  13.028 ms
10  124.65.194.161 (124.65.194.161)  12.287 ms 124.65.194.29 (124.65.194.29)  6.079 ms 123.126.0.253 (123.126.0.253)  5.789 ms
11  * * *
12  * * *
13  * * *
14  * * *
15  * * *
16  * * *
17  * * *
18  * * *
19  * * *
20  * * *
21  * * *
22  * * *
23  * * *
24  * * *
25  * * *
26  * * *
27  * * *
28  * * *
29  * * *
30  * * *
```

on the computer result:

```
~ traceroute www.google.com
traceroute to www.google.com (199.59.148.209), 64 hops max, 52 byte packets
 1  bogon (172.16.30.1)  2.450 ms  1.484 ms  1.350 ms
 2  bogon (10.10.10.1)  2.199 ms  1.359 ms  1.304 ms
 3  * * *
 4  * bogon (10.0.12.141)  3.297 ms  4.251 ms
 5  bogon (10.0.12.230)  4.993 ms  20.059 ms  60.508 ms
 6  124.65.242.98 (124.65.242.98)  14.453 ms  8.348 ms  7.540 ms
 7  * * *
 8  61.51.112.21 (61.51.112.21)  7.441 ms  6.072 ms  8.698 ms
 9  61.148.156.229 (61.148.156.229)  7.174 ms
    123.126.8.245 (123.126.8.245)  9.173 ms
    61.148.156.177 (61.148.156.177)  7.604 ms
10  202.96.12.33 (202.96.12.33)  4.741 ms
    124.65.194.17 (124.65.194.17)  6.080 ms
    124.65.194.173 (124.65.194.173)  14.929 ms
11  * * *
12  * * *
13  * * *
14  * * *
15  * * *
16  * * *
17  * * *
18  * * *
19  * * *
20  * * *
21  * * *
22  * * *
23  * * *
24  * * *
25  * * *
26  * * *
27  * * *
28  * * *
29  * * *
30  * * *
```

if you don't want to build source code, you can download it from [libs](libs) folder.

enjoying traceroute!
