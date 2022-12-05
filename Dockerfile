FROM opensuse/tumbleweed

LABEL description="Generic opensuse container"
LABEL maintainer="graham@efficient.computer"

# Basic configuration
RUN zypper --non-interactive refresh && \
	zypper --non-interactive update && \
	zypper --non-interactive install git cmake 

# Verilator
RUN zypper --non-interactive install \
		autoconf gcc gcc-c++ flex bison ccache numactl \
		python3 perl perl-doc gperftools-devel
RUN git clone https://github.com/verilator/verilator
RUN cd verilator && git pull && git checkout stable
RUN cd verilator && autoconf && ./configure && make -j16 && make install

