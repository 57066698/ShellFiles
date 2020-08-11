nvidia_driver=450.57
cuda=10.2

echo "---- This is script to download nvidia-driver, cuda, cudnn and anaconda for centos7 install"
echo "---- It will download nvidia-driver, cuda, anaconda directly and then download cudnn from google cloud"
echo "---- nvidia_driver=${nvidia_driver}, cuda=${cuda}"

yum -q -y install wget

if test -f "nvidia_driver.run"; then
    echo "---- nvidia driver exists."
else
    wget -O nvidia_driver.run http://us.download.nvidia.com/XFree86/Linux-x86_64/${nvidia_driver}/NVIDIA-Linux-x86_64-${nvidia_driver}.run
    echo "---- nvidia driver download finished."
fi

if test -f "cuda.run"; then
    echo "---- cuda exists."
else
    wget -O cuda.run http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_440.33.01_linux.run
    echo "---- cuda download finished"
fi

if test -f "anaconda.sh"; then
    echo "---- anaconda exists."
else
    wget -O anaconda.sh https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2020.02-Linux-x86_64.sh
    echo "---- anaconda download finished"
fi

yum -q -y install git

if test -f "cudnn.tgz"; then
   echo "---- cudnn exists"
else
   git clone git://github.com/circulosmeos/gdown.pl.git
   gdown.pl/gdown.pl 'https://drive.google.com/file/d/1ve6ffrgc1jbWTSn0SE0Sc66V6ZzChWfV/view?usp=sharing' cudnn.tgz
   echo "---- cudnn download finished"
fi
