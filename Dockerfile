FROM nvidia/cuda:10.2-devel-ubuntu16.04
MAINTAINER Jovanie De La Cruz

WORKDIR /
# Package and dependency setup
RUN apt-get update \
  && apt-get -y install git \
     cmake \
     perl \
     libdbus-1-dev \
     gcc 
# Git repo set up
RUN git clone https://github.com/ethereum-mining/ethminer.git; \
    cd ethminer; \
    git checkout tags/v0.18.0 ; \
    git submodule update --init --recursive; \
# Build ethminer
RUN cd ethminer;\
    mkdir build;\
    cd build; \
    cmake .. -DETHASHCUDA=ON -DETHASHCL=OFF -DETHSTRATUM=ON; \
    cmake --build . ;\
    make install
#Expose Ethminer status API to random port

# Env setup; Defaults provided; adjust as needed
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
ENV GPU_TEMP_START=60
ENV GPU_TEMP_STOP=90
ENV ETHMINER_API_PORT=3000
EXPOSE ${ETHMINER_API_PORT}/tcp
ENV STRATUM=stratum1+ssl
ENV WALLET_ADDR=0x2ed422140EFF2e5cC722Aa47bA40572D12c225e0
ENV WORKER=Docker-Ethminer-Github
ENV WORKER_PASS=
ENV MINING_POOL=us2.ethermine.org
ENV MINING_POOL_PORT=5555
ENV GPU_MAX_ALLOC_PERCENT=100
ENV GPU_SINGLE_ALLOC_PERCENT=100
ENV GPU_FORCE_64BIT_PTR=0
ENV GPU_MAX_HEAP_SIZE=100
ENV GPU_USE_SYNC_OBJECTS=1

CMD ["sh", "-c", "/usr/local/bin/ethminer -U --HWMON 2 --tstart ${GPU_TEMP_START} --tstop ${GPU_TEMP_STOP} --exit --api-port -${ETHMINER_API_PORT} -P ${STRATUM}://${WALLET_ADDR}.${WORKER}:${WORKER_PASS}@${MINING_POOL}:${MINING_POOL_PORT}"]
