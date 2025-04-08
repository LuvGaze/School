import matplotlib.pyplot as plt

# 假设你从test_model.py或其他方式获取了accuracies列表
# accuracies = [(5, 78.5), (10, 82.3), (15, 85.1), (20, 87.2), (25, 88.5), (30, 89.7)]
# 这里我们手动输入以模拟获取的数据
accuracies = [
    (5, 78.5),
    (10, 82.3),
    (15, 85.1),
    (20, 87.2),
    (25, 88.5),
    (30, 89.7)
]

epochs, accuracies_percent = zip(*accuracies)

plt.plot(epochs, accuracies_percent, marker='o')
plt.xlabel('Epochs')
plt.ylabel('Accuracy (%)')
plt.title('Model Accuracy Over Epochs')
plt.grid(True)
plt.show()
