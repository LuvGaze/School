import torch
import torch.nn as nn
import torch.optim as optim
import torchvision
import torchvision.transforms as transforms
import matplotlib.pyplot as plt

# 数据预处理
# 创建一个transform流水线，包括水平翻转、随机裁剪、转换为张量和标准化
transform = transforms.Compose(
    [transforms.RandomHorizontalFlip(),  # 随机水平翻转图像
     transforms.RandomCrop(32, padding=4),  # 在图像边缘添加4个像素的填充，然后随机裁剪出32x32的图像
     transforms.ToTensor(),  # 将PIL图像或numpy.ndarray转换为FloatTensor，并归一化到[0, 1]
     transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))])  # 使用给定的均值和标准差标准化图像

# 加载CIFAR-10数据集
trainset = torchvision.datasets.CIFAR10(root='./data', train=True, download=True, transform=transform)
trainloader = torch.utils.data.DataLoader(trainset, batch_size=128, shuffle=True, num_workers=4)
testset = torchvision.datasets.CIFAR10(root='./data', train=False, download=True, transform=transform)
testloader = torch.utils.data.DataLoader(testset, batch_size=100, shuffle=False, num_workers=2)

classes = ('飞机', '汽车', '鸟', '猫', '鹿', '狗', '青蛙', '马', '船', '卡车')

# 定义卷积神经网络
class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        # 定义卷积层、批量归一化层、池化层等
        self.conv1 = nn.Conv2d(3, 32, 3, padding=1)  # 输入通道3，输出通道32，卷积核大小3x3，边缘填充1
        self.bn1 = nn.BatchNorm2d(32)  # 对32个通道的输出进行批量归一化
        self.pool = nn.MaxPool2d(2, 2)  # 2x2的最大池化
        self.conv2 = nn.Conv2d(32, 64, 3, padding=1)
        self.bn2 = nn.BatchNorm2d(64)
        self.conv3 = nn.Conv2d(64, 128, 3, padding=1)
        self.bn3 = nn.BatchNorm2d(128)
        self.dropout = nn.Dropout(0.5)  # Dropout层，以0.5的概率随机丢弃一些神经元
        self.fc1 = nn.Linear(128 * 4 * 4, 512)  # 全连接层，输入特征数为128*4*4（卷积层输出特征图大小）
        self.fc2 = nn.Linear(512, 10)  # 输出层，10个类别

    def forward(self, x):
        # 定义前向传播过程
        x = self.pool(F.relu(self.bn1(self.conv1(x))))
        x = self.pool(F.relu(self.bn2(self.conv2(x))))
        x = self.pool(F.relu(self.bn3(self.conv3(x))))
        x = x.view(-1, 128 * 4 * 4)  # 展平为一维向量
        x = self.dropout(F.relu(self.fc1(x)))
        x = self.fc2(x)
        return x

import torch.nn.functional as F  # 导入F模块，用于激活函数等

net = Net()  # 实例化网络

# 定义损失函数和优化器
criterion = nn.CrossEntropyLoss()  # 交叉熵损失，用于多分类
optimizer = optim.Adam(net.parameters(), lr=0.001)  # Adam优化器，学习率0.001

# 训练网络
def train_network():
    epochs = 20  # 训练轮数
    train_losses = []  # 存储每100个batch的平均损失
    for epoch in range(epochs):
        running_loss = 0.0
        for i, data in enumerate(trainloader, 0):
            inputs, labels = data
            optimizer.zero_grad()  # 清空梯度
            outputs = net(inputs)  # 前向传播
            loss = criterion(outputs, labels)  # 计算损失
            loss.backward()  # 反向传播
            optimizer.step()  # 更新参数
            running_loss += loss.item()
            if i % 100 == 99:  # 每100个batch打印一次
                print('[%d, %5d] 损失: %.3f' % (epoch + 1, i + 1, running_loss / 100))
                train_losses.append(running_loss / 100)
                running_loss = 0.0

    print('训练完成')
    plt.plot(train_losses)  # 绘制训练损失曲线
    plt.xlabel('轮次')
    plt.ylabel('损失')
    plt.title('训练损失曲线')
    plt.show()
# 测试网络并记录每个类别的准确率
def test_network():
    correct = 0
    total = 0
    class_correct = list(0. for i in range(10))  # 初始化每个类别的正确预测数为0
    class_total = list(0. for i in range(10))    # 初始化每个类别的总预测数为0

    with torch.no_grad():  # 禁用梯度计算
        for data in testloader:
            images, labels = data
            outputs = net(images)
            _, predicted = torch.max(outputs.data, 1)  # 获取预测结果
            total += labels.size(0)
            correct += (predicted == labels).sum().item()

            # 更新每个类别的正确预测数和总预测数
            c = (predicted == labels).squeeze()  # 将布尔值张量压缩为一维
            for i in range(4):  # 由于batch_size为100，这里我们每次处理4个（或更少，如果是最后一个batch）
                label = labels[i]
                class_correct[label] += c[i].item()
                class_total[label] += 1

    # 计算每个类别的准确率
    class_accuracy = [100 * class_correct[i] / class_total[i] if class_total[i] > 0 else 0 for i in range(10)]

    print('网络在10000张测试图像上的总准确率: %d %%' % (100 * correct / total))

    # 绘制每个类别的准确率直方图
    plt.figure(figsize=(10, 6))
    plt.bar(range(10), class_accuracy, align='center', alpha=0.7)
    plt.xticks(range(10), classes, rotation=45)
    plt.ylabel('准确率 (%)')
    plt.title('每个类别的准确率')
    plt.show()

if __name__ == '__main__':
    from multiprocessing import freeze_support  # Windows下支持多进程
    freeze_support()
    train_network()  # 训练网络
    test_network()   # 测试网络并记录每个类别的准确率
