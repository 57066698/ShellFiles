echo "---- this script will install cuda cudnn and conda for centos7 , install files must be prepared by download.sh"

echo "---- install cuda"
sh cuda.run --silent --toolkit

echo "---- install cudnn"
tar -xzvf cudnn.tgz
sudo cp cuda/include/cudnn*.h /usr/local/cuda-11.1/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda-11.1/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn*.h /usr/local/cuda-11.1/lib64/libcudnn*

echo "---- install conda"
bash anaconda.sh -b -p $HOME/anaconda
echo "---- add cuda conda to path"
cat <<EOT>> ~/.bashrc
export PATH=/usr/local/cuda-11.1/bin:$HOME/anaconda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.1/lib64:$LD_LIBRARY_PATH
EOT
source ~/.bashrc
echo "---- set conda source to tsinghua"
conda config --set show_channel_urls yes
cat <<EOT>> ~/.condarc
channels:
  - defaults
channel_alias: https://mirrors.tuna.tsinghua.edu.cn/anaconda
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/pro
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
EOT
echo "---- set pip source to aliyun"
mkdir ~/.pip
cat <<EOT>> ~/.pip/pip.conf
[global]
trusted-host=mirrors.aliyun.com
index-url=http://mirrors.aliyun.com/pypi/simple
EOT
echo "--- init anaconda for bash"
bash ~/anaconda/bin/conda init
