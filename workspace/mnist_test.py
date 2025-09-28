import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# 데이터셋 로드
(x_train, y_train), (x_test, y_test) = keras.datasets.mnist.load_data()
x_train, x_test = x_train / 255.0, x_test / 255.0

# 간단한 MLP 모델 정의
model = keras.Sequential([
    layers.Flatten(input_shape=(28, 28)),
    layers.Dense(128, activation="relu"),
    layers.Dropout(0.2),
    layers.Dense(10, activation="softmax")
])

# 컴파일
model.compile(optimizer="adam",
              loss="sparse_categorical_crossentropy",
              metrics=["accuracy"])

# GPU 확인
print("Num GPUs Available:", len(tf.config.list_physical_devices('GPU')))

# 학습
model.fit(x_train, y_train, epochs=5, validation_split=0.1)

# 평가
test_loss, test_acc = model.evaluate(x_test, y_test, verbose=2)
print(f"\n테스트 정확도: {test_acc:.4f}")

