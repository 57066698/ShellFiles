yum install wget
wget -O cuda.run http://developer.download.nvidia.com/compute/cuda/11.0.2/local_installers/cuda_11.0.2_450.51.05_linux.run
bash cuda.run
echo "export PATH=/usr/local/cuda/bin:'$'PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc

# $vi ~/.bashrc , go bottom, replace '$' to $ 
# $source ./bashrc
