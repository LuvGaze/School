import matplotlib.pyplot as plt
import torch
from matplotlib import font_manager
from torch.utils.data import DataLoader
from torchvision import transforms
from torchvision.datasets import MNIST

# 设置中文字体
font = font_manager.FontProperties(fname="C:/Windows/Fonts/simsun.ttc")  # Windows路径示例
# 或者
# font = font_manager.FontProperties(fname="C:/Windows/Fonts/msyh.ttc")  # 微软雅黑

# 解决负号 '-' 显示为方块的问题
plt.rcParams['axes.unicode_minus'] = False


# 定义神经网络模型
class Net(torch.nn.Module):
    def __init__(self):
        super().__init__()
        # 定义网络层：4个全连接层
        # 输入层：28*28 = 784个输入，输出64个神经元
        self.fc1 = torch.nn.Linear(28 * 28, 64)
        # 隐藏层1：64个神经元
        self.fc2 = torch.nn.Linear(64, 64)
        # 隐藏层2：64个神经元
        self.fc3 = torch.nn.Linear(64, 64)
        # 输出层：10个神经元，表示10个数字类别（0-9）
        self.fc4 = torch.nn.Linear(64, 10)

    def forward(self, x):
        # 定义前向传播
        # 使用ReLU激活函数
        x = torch.nn.functional.relu(self.fc1(x))
        x = torch.nn.functional.relu(self.fc2(x))
        x = torch.nn.functional.relu(self.fc3(x))
        # 使用log_softmax函数进行归一化，输出10个类别的对数概率
        x = torch.nn.functional.log_softmax(self.fc4(x), dim=1)
        return x


# 获取数据集并转换成DataLoader
def get_data_loader(is_train):
    # 定义数据预处理：将图像转换为Tensor
    to_tensor = transforms.Compose([transforms.ToTensor()])
    # 下载并加载MNIST数据集
    data_set = MNIST("", is_train, transform=to_tensor, download=True)
    # 返回DataLoader，批量大小为15，数据随机打乱
    return DataLoader(data_set, batch_size=15, shuffle=True)


# 模型评估函数
def evaluate(test_data, net):
    n_correct = 0
    n_total = 0
    with torch.no_grad():  # 在评估时不计算梯度，节省内存
        for (x, y) in test_data:
            # 前向传播，x为输入图像，y为真实标签
            outputs = net.forward(x.view(-1, 28 * 28))  # 将28x28的图像展平为1维
            for i, output in enumerate(outputs):
                # 如果预测的类别与真实标签相同，计数正确预测
                if torch.argmax(output) == y[i]:
                    n_correct += 1
                n_total += 1
    # 返回准确率
    return n_correct / n_total


# 主函数
def main():
    # 获取训练集和测试集的数据加载器
    train_data = get_data_loader(is_train=True)
    test_data = get_data_loader(is_train=False)

    # 初始化神经网络
    net = Net()

    # 初始时评估模型的准确率
    print("初始准确率", evaluate(test_data, net))

    # 使用Adam优化器，学习率为0.001
    optimizer = torch.optim.Adam(net.parameters(), lr=0.001)

    # 训练10轮
    for epoch in range(5):
        for (x, y) in train_data:
            net.zero_grad()  # 清除前一轮的梯度
            output = net.forward(x.view(-1, 28 * 28))  # 前向传播
            # 计算负对数似然损失
            loss = torch.nn.functional.nll_loss(output, y)
            loss.backward()  # 反向传播，计算梯度
            optimizer.step()  # 更新模型参数
        # 每一轮训练后，评估并打印准确率
        print("第 ", epoch + 1, " 轮训练，准确率： ", evaluate(test_data, net))

    # 训练结束后，进行预测并可视化结果
    for (n, (x, _)) in enumerate(test_data):
        if n > 3:  # 只展示前4张图片
            break
        # 预测数字
        predict = torch.argmax(net.forward(x[0].view(-1, 28 * 28)))  # x[0]是一个批次中的第一个图像
        plt.figure(n)
        plt.imshow(x[0].view(28, 28))  # 显示图片
        plt.title("预测结果: " + str(int(predict)), fontproperties=font)  # 设置标题并显示中文
    plt.show()


# 程序入口，调用main函数
if __name__ == "__main__":
    main()
