import tensorflow as tf

print("GPU Available:", tf.test.is_gpu_available())
print("Physical GPUs:", tf.config.list_physical_devices('GPU'))
print("Logical GPUs:", tf.config.list_logical_devices('GPU'))
