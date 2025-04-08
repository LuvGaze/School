import torch
import torchvision
import torchvision.transforms as transforms
import os
import torch.nn as nn
import torch.nn.functional as F


# 定义简单的卷积神经网络
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
        x = self.pool(F.relu(self.conv1(x)))
        x = self.pool(F.relu(self.conv2(x)))
        x = x.view(-1, 16 * 5 * 5)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = self.fc3(x)
        return x


# 数据预处理
transform = transforms.Compose(
    [transforms.ToTensor(),
     transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))])

# 加载CIFAR-10测试集
testset = torchvision.datasets.CIFAR10(root='./data', train=False,
                                       download=True, transform=transform)
testloader = torch.utils.data.DataLoader(testset, batch_size=100,
                                         shuffle=False, num_workers=2)


# 测试函数
def test_model(model_path):
    net = Net()
    net.load_state_dict(torch.load(model_path))
    net.eval()

    correct = 0
    total = 0
    with torch.no_grad():
        for data in testloader:
            images, labels = data
            outputs = net(images)
            _, predicted = torch.max(outputs.data, 1)
            total += labels.size(0)
            correct += (predicted == labels).sum().item()

    accuracy = 100 * correct / total
    return accuracy


# 记录不同epoch下的准确度
epochs_list = [5, 10, 15, 20, 25, 30]
accuracies = []
save_dir = 'models'
for epochs in epochs_list:
    model_path = os.path.join(save_dir, f'cifar10_net_epoch_{epochs}.pth')
    if os.path.exists(model_path):
        accuracy = test_model(model_path)
        accuracies.append((epochs, accuracy))
        print(f'Epochs: {epochs}, Accuracy: {accuracy:.2f}%')
    else:
        print(f'Model for {epochs} epochs does not exist.')

# 返回准确度列表（此处的返回语句在脚本中不会被使用，因为脚本通常不返回值）
# 若需要在其他地方使用 accuracies 列表，可以考虑将其写入文件或作为函数的返回值（如果这段代码被封装在函数中）
# For example, to print the accuracies list at the end:
print("Accuracies for different epochs:", accuracies)