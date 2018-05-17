# Monitor network connections (Linux, Solaris)
while [ 1 ]; do sleep 2; clear; uname -a; netstat -na | grep 10.1.1; done;

# Netzwerkverbindungen überwachen (Linux)
watch netstat -na
