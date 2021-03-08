# Ethereum CUDA Miner


### Docker container for Ethereum mining with CUDA.

Simple and easy to run, if you have a Nvidia GPU and want to mine eth.

**Note:** This image builds ethminer, which is an activily maintained Genoil fork <https://github.com/ethereum-mining/ethminer>

### Requirements
- Nvidia drivers for your GPU, you can get them here: [Nvidia drivers](http://www.nvidia.com/Download/index.aspx)
- Nvidia-docker (so docker can access your GPU) install instructions here: [nvidia-docker](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)

### How to run
Simply create this docker image from the dockerfile. It will create a container that will need minor reconfiguring.
1. Enable nvidia-runtime for that container
2. Adjust mining pool and wallet details
3. Publish ethminer-api port
```
$ nvidia-docker run -it anthonytatowicz/eth-cuda-miner ARG1 ARG2 ...

# Example
$ nvidia-docker run -it anthonytatowicz/eth-cuda-miner \
-S us-west1.nanopool.org:9999 \
-O <your_wallet_address>.<worker_name>/<your_email>
```

**Note:** `-U` is set by default

### Help
`$ etherminer --help`

### Questions?
If this helped and you'd like to leave a tip --> `0x2ed422140EFF2e5cC722Aa47bA40572D12c225e0`
