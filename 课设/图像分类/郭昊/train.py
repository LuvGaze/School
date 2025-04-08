import torch
import torch.nn as nn
import torch.optim as optim
import torchvision
import torchvision.transforms as transforms
import os
import multiprocessing  # 导入multiprocessing模块以便使用freeze_support函数（如果需要）

# 数据预处理
transform = transforms.Compose(
    [transforms.ToTensor(),
     transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))])

# 加载CIFAR-10数据集
trainset = torchvision.datasets.CIFAR10(root='./data', train=True,
                                        download=True, transform=transform)
trainloader = torch.utils.data.DataLoader(trainset, batch_size=100,
                                          shuffle=True, num_workers=2)


# 定义卷积神经网络
class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = nn.Conv2d(3, 6, 5)
        self.pool = nn.MaxPool2d(2, 2)
        self.conv2 = nn.Conv2d(6, 16, 5)
        self.fc1 = nn.Linear(16 * 5 * 5, 120)
        self.fc2 = nn.Linear(120, 84)
        self.fc3 = nn.Linear(84, 10)

    def forward(self, x):
        x = self.pool(nn.functional.relu(self.conv1(x)))
        x = self.pool(nn.functional.relu(self.conv2(x)))
        x = x.view(-1, 16 * 5 * 5)
        x = nn.functional.relu(self.fc1(x))
        x = nn.functional.relu(self.fc2(x))
        x = self.fc3(x)
        return x


# 训练函数
def train_model(epochs, save_dir='./models'):
    # 确保模型目录存在
    os.makedirs(save_dir, exist_ok=True)

    net = Net()
    criterion = nn.CrossEntropyLoss()
    optimizer = optim.SGD(net.parameters(), lr=0.001, momentum=0.9)

    for epoch in range(epochs):
        running_loss = 0.0
        for i, data in enumerate(trainloader, 0):
            inputs, labels = data
            optimizer.zero_grad()
            outputs = net(inputs)
            loss = criterion(outputs, labels)
            loss.backward()
            optimizer.step()
            running_loss += loss.item()
            if i % 200 == 199:
                print(f'Epoch {epoch + 1}, Batch {i + 1}, Loss: {running_loss / 200:.3f}')
                running_loss = 0.0

        # 保存模型
        model_path = os.path.join(save_dir, f'cifar10_net_epoch_{epoch + 1}.pth')
        torch.save(net.state_dict(), model_path)
        print(f'Model saved at {model_path}')


if __name__ == '__main__':
    # 确保在Windows上运行时不会出现多进程相关的问题
    multiprocessing.freeze_support()  # 如果你的代码将被冻结成一个可执行文件，保留这行；否则可以注释掉或删除

    # 训练5, 10, 15, 20, 25, 30次
    epochs_list = [5, 10, 15, 20, 25, 30]
    for epochs in epochs_list:
        train_model(epochs)