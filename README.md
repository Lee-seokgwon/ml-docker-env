# Deep Learning Docker Env

## 사용법

### 0. 호스트 HW 환경
<img width="868" height="806" alt="Screenshot from 2025-09-29 01-25-11" src="https://github.com/user-attachments/assets/eddf2ca0-2eb5-47ed-ab98-8b00d3148cfa" />
<br> 호스트 HW가 다르면, 도커파일 내부 베이스 이미지를 확인 후 수정해야함 (HW마다 cuDNN, Cuda 지원범위가 다름)

---

### 1. 컨테이너 빌드 & 실행

```bash
docker compose build --no-cache
docker compose up -d
docker exec -it keras-dev bash
```

---
## 2. 텐서플로우 환경

```bash
# TensorFlow
conda create -n tf2 python=3.10 tensorflow=2.15 -c conda-forge -y
source /opt/conda/etc/profile.d/conda.sh && conda activate tf2
python -c "import tensorflow as tf; print(tf.__version__); print(tf.config.list_physical_devices('GPU'))"
```

---
## 3. 파이토치 환경

```bash
# PyTorch
conda create -n torch2 python=3.10 pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia -y
source /opt/conda/etc/profile.d/conda.sh && conda activate torch2
python -c "import torch; print(torch.__version__); print(torch.cuda.get_device_name(0))"
```

---

## 📦 추가 설치 패키지 (optional)

```bash
# HuggingFace NLP/멀티모달
pip install transformers datasets evaluate

# 실험 관리 & 시각화
pip install wandb tensorboard matplotlib seaborn tqdm

# 데이터 처리 & 전처리
pip install opencv-python albumentations scikit-learn
```
