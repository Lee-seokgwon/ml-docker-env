# TensorFlow GPU 공식 이미지 기반 (CUDA + cuDNN 포함)
FROM tensorflow/tensorflow:2.15.0-gpu

# ========================
# 기본 유틸 설치 + pip
# ========================
RUN apt-get update && apt-get install -y \
    wget curl bzip2 \
    python3-pip \
    nano vim htop unzip git build-essential \
    gedit x11-apps x11-utils \
    python3-tk python3-dev python3-opencv \
 && rm -rf /var/lib/apt/lists/*

# pip 업그레이드
RUN python3 -m pip install --upgrade pip

# ========================
# Miniconda 설치
# ========================
WORKDIR /opt
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && \
    bash miniconda.sh -b -p /opt/conda && \
    rm miniconda.sh
ENV PATH=/opt/conda/bin:$PATH

# ========================
# Anaconda 채널 TOS 동의 + 기본 세팅
# ========================
RUN conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main && \
    conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r && \
    conda update -n base -c defaults conda -y

# 작업 디렉토리
WORKDIR /workspace

CMD ["/bin/bash"]

