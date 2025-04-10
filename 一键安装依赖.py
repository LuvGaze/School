import subprocess
import sys
from pip._internal.cli.main import main as pip_main
from tqdm import tqdm
import time
from colorama import init, Fore, Style
import argparse
import tkinter as tk
from tkinter import ttk, messagebox, scrolledtext
import threading
import queue
import os

# 初始化 colorama
init()


class DependencyInstaller:
    def __init__(self, root):
        # UI配置参数
        self.ui_config = {
            'window': {
                'width': 740,
                'height': 600,
                'padding': 10
            },
            'output': {
                'height': 15,
                'width': 100
            },
            'listbox': {
                'height': 8
            },
            'progress': {
                'length': 400
            }
        }

        self.root = root
        self.root.title("Python 依赖包安装器")
        self.root.geometry(f"{self.ui_config['window']['width']}x{self.ui_config['window']['height']}")

        # 设置主题
        style = ttk.Style()
        style.configure('TButton', padding=5)
        style.configure('TFrame', background='#f0f0f0')
        style.configure('TLabelframe', background='#f0f0f0')

        # 创建主框架
        self.main_frame = ttk.Frame(root, padding=self.ui_config['window']['padding'])
        self.main_frame.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))

        # 创建输出文本框
        self.output_text = scrolledtext.ScrolledText(
            self.main_frame,
            height=self.ui_config['output']['height'],
            width=self.ui_config['output']['width']
        )
        self.output_text.grid(row=0, column=0, columnspan=2, pady=5, sticky=(tk.W, tk.E))

        # 创建按钮框架
        self.button_frame = ttk.Frame(self.main_frame)
        self.button_frame.grid(row=1, column=0, columnspan=2, pady=5)

        # 创建取消按钮（初始隐藏）
        self.cancel_btn = ttk.Button(self.button_frame, text="取消安装", command=self.cancel_installation)
        self.cancel_btn.grid(row=0, column=0, padx=5)
        self.cancel_btn.grid_remove()  # 初始隐藏

        # 创建按钮
        self.install_all_btn = ttk.Button(self.button_frame, text="一键安装所有依赖", command=self.install_all)
        self.install_all_btn.grid(row=0, column=1, padx=5)

        self.check_updates_btn = ttk.Button(self.button_frame, text="检查更新", command=self.check_updates)
        self.check_updates_btn.grid(row=0, column=2, padx=5)

        self.update_requirements_btn = ttk.Button(self.button_frame, text="更新requirements.txt",
                                                  command=self.update_requirements)
        self.update_requirements_btn.grid(row=0, column=3, padx=5)

        # 创建包列表框架（水平布局）
        self.packages_frame = ttk.Frame(self.main_frame)
        self.packages_frame.grid(row=2, column=0, columnspan=2, pady=5, sticky=(tk.W, tk.E))

        # 创建依赖包列表框架
        self.package_frame = ttk.LabelFrame(self.packages_frame, text="依赖包列表", padding="5")
        self.package_frame.pack(side=tk.LEFT, fill=tk.BOTH, expand=True, padx=5)

        # 创建包列表容器
        self.package_container = ttk.Frame(self.package_frame)
        self.package_container.pack(fill=tk.BOTH, expand=True)

        # 创建包列表
        self.package_listbox = tk.Listbox(
            self.package_container,
            selectmode=tk.MULTIPLE,
            height=self.ui_config['listbox']['height'],
            selectbackground='white',  # 设置选中项背景色为白色
            selectforeground='black'  # 设置选中项文字颜色为黑色
        )
        self.package_listbox.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

        # 创建滚动条
        scrollbar = ttk.Scrollbar(self.package_container, orient=tk.VERTICAL, command=self.package_listbox.yview)
        scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
        self.package_listbox.config(yscrollcommand=scrollbar.set)

        # 创建安装选中按钮
        self.install_selected_btn = ttk.Button(self.package_frame, text="安装选中项", command=self.install_selected)
        self.install_selected_btn.pack(pady=5)

        # 创建已安装包框架
        self.installed_frame = ttk.LabelFrame(self.packages_frame, text="已安装的包", padding="5")
        self.installed_frame.pack(side=tk.LEFT, fill=tk.BOTH, expand=True, padx=5)

        # 创建已安装包列表容器
        self.installed_container = ttk.Frame(self.installed_frame)
        self.installed_container.pack(fill=tk.BOTH, expand=True)

        # 创建已安装包列表
        self.installed_listbox = tk.Listbox(
            self.installed_container,
            selectmode=tk.MULTIPLE,
            height=self.ui_config['listbox']['height'],
            selectbackground='white',  # 设置选中项背景色为白色
            selectforeground='black'  # 设置选中项文字颜色为黑色
        )
        self.installed_listbox.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

        # 创建已安装包滚动条
        installed_scrollbar = ttk.Scrollbar(self.installed_container, orient=tk.VERTICAL,
                                            command=self.installed_listbox.yview)
        installed_scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
        self.installed_listbox.config(yscrollcommand=installed_scrollbar.set)

        # 创建卸载按钮
        self.uninstall_btn = ttk.Button(self.installed_frame, text="卸载选中项", command=self.uninstall_selected)
        self.uninstall_btn.pack(pady=5)

        # 创建进度条框架
        self.progress_frame = ttk.LabelFrame(self.main_frame, text="安装进度", padding="5")
        self.progress_frame.grid(row=3, column=0, columnspan=2, pady=5, sticky=(tk.W, tk.E))

        # 创建进度条容器框架（用于居中）
        self.progress_container = ttk.Frame(self.progress_frame)
        self.progress_container.pack(expand=True, fill=tk.X)

        # 创建总进度条
        self.total_progress = ttk.Progressbar(
            self.progress_container,
            length=self.ui_config['progress']['length'],
            mode='determinate'
        )
        self.total_progress.pack(pady=5)
        self.total_label = ttk.Label(self.progress_container, text="总进度: 0%")
        self.total_label.pack(pady=5)

        # 初始化包列表
        self.load_packages()
        self.load_installed_packages()

        # 创建消息队列
        self.message_queue = queue.Queue()
        self.root.after(100, self.process_queue)

        # 安装控制变量
        self.installation_running = False
        self.cancel_installation_flag = False

        # 绑定选择事件
        self.package_listbox.bind('<Button-1>', self.handle_selection)
        self.installed_listbox.bind('<Button-1>', self.handle_selection)

    def handle_selection(self, event):
        listbox = event.widget
        # 获取点击位置的索引
        index = listbox.nearest(event.y)
        if index >= 0:  # 确保点击在有效范围内
            # 获取当前项的内容
            item = listbox.get(index)
            if item.endswith(" ✓"):
                # 如果已经有对钩，则移除对钩
                listbox.delete(index)
                listbox.insert(index, item[:-2])
                listbox.selection_clear(index)  # 取消选中
            else:
                # 如果没有对钩，则添加对钩
                listbox.delete(index)
                listbox.insert(index, f"{item} ✓")
                listbox.selection_set(index)  # 设置选中

    def load_packages(self):
        try:
            with open('requirements.txt', 'r') as f:
                packages = [line.strip() for line in f if line.strip()]
            self.package_listbox.delete(0, tk.END)
            for package in packages:
                self.package_listbox.insert(tk.END, package)
        except Exception as e:
            self.message_queue.put((f"加载包列表失败: {str(e)}", "error"))

    def load_installed_packages(self):
        try:
            result = subprocess.run(
                [sys.executable, "-m", "pip", "list"],
                capture_output=True,
                text=True
            )
            if result.returncode == 0:
                packages = [line.split()[0] for line in result.stdout.split('\n')[2:] if line.strip()]
                self.installed_listbox.delete(0, tk.END)
                for package in packages:
                    self.installed_listbox.insert(tk.END, package)
        except Exception as e:
            self.message_queue.put((f"加载已安装包列表失败: {str(e)}", "error"))

    def log_message(self, message, level="info"):
        if level == "error":
            self.output_text.insert(tk.END, f"错误: {message}\n", "error")
        elif level == "success":
            self.output_text.insert(tk.END, f"成功: {message}\n", "success")
        else:
            self.output_text.insert(tk.END, f"{message}\n")
        self.output_text.see(tk.END)

    def process_queue(self):
        try:
            while True:
                message = self.message_queue.get_nowait()
                self.log_message(message[0], message[1])
        except queue.Empty:
            pass
        self.root.after(100, self.process_queue)

    def install_package(self, package_name, update=False):
        try:
            # 检查包是否已安装
            result = subprocess.run(
                [sys.executable, "-m", "pip", "show", package_name],
                capture_output=True,
                text=True
            )

            if result.returncode == 0:
                if not update:
                    self.message_queue.put((f"{package_name} 已经安装，无需重复安装", "info"))
                    return True
                else:
                    self.message_queue.put((f"正在更新 {package_name}...", "info"))
                    command = [sys.executable, "-m", "pip", "install", "--upgrade", package_name]
            else:
                self.message_queue.put((f"正在安装 {package_name}...", "info"))
                command = [sys.executable, "-m", "pip", "install", package_name]

            result = subprocess.run(
                command,
                capture_output=True,
                text=True
            )

            if result.returncode == 0:
                self.message_queue.put((f"{package_name} {'更新' if update else '安装'}成功", "success"))
                self.load_installed_packages()  # 刷新已安装包列表
                return True
            else:
                self.message_queue.put((f"{package_name} {'更新' if update else '安装'}失败: {result.stderr}", "error"))
                return False

        except Exception as e:
            self.message_queue.put((f"{package_name} {'更新' if update else '安装'}出错: {str(e)}", "error"))
            return False

    def uninstall_package(self, package_name):
        try:
            self.message_queue.put((f"正在卸载 {package_name}...", "info"))
            result = subprocess.run(
                [sys.executable, "-m", "pip", "uninstall", "-y", package_name],
                capture_output=True,
                text=True
            )

            if result.returncode == 0:
                self.message_queue.put((f"{package_name} 卸载成功", "success"))
                self.load_installed_packages()  # 刷新已安装包列表
                return True
            else:
                self.message_queue.put((f"{package_name} 卸载失败: {result.stderr}", "error"))
                return False

        except Exception as e:
            self.message_queue.put((f"{package_name} 卸载出错: {str(e)}", "error"))
            return False

    def check_package_installed(self, package_name):
        try:
            # 使用 pip list 命令获取所有已安装的包
            result = subprocess.run(
                [sys.executable, "-m", "pip", "list"],
                capture_output=True,
                text=True
            )

            if result.returncode == 0:
                # 解析输出，查找包名
                for line in result.stdout.split('\n'):
                    if line.strip():
                        # 获取包名（第一列）
                        installed_package = line.split()[0].lower()
                        if installed_package == package_name.lower():
                            return True
            return False
        except Exception as e:
            self.message_queue.put((f"检查包 {package_name} 状态时出错: {str(e)}", "error"))
            return False

    def install_all(self):
        if self.installation_running:
            return

        # 创建确认对话框
        if not messagebox.askyesno("确认", "确定要安装所有依赖包吗？"):
            return

        self.installation_running = True
        self.cancel_installation_flag = False
        self.install_all_btn['state'] = 'disabled'
        self.install_selected_btn['state'] = 'disabled'
        self.uninstall_btn['state'] = 'disabled'
        self.check_updates_btn['state'] = 'disabled'
        self.update_requirements_btn['state'] = 'disabled'
        self.cancel_btn.grid()  # 显示取消按钮

        def install_thread():
            packages = self.package_listbox.get(0, tk.END)
            total = len(packages)

            # 先检查所有包的状态
            self.message_queue.put(("\n" + "="*50, "info"))
            self.message_queue.put(("\n开始检测依赖包状态...", "info"))
            self.message_queue.put(("="*50 + "\n", "info"))
            installed_packages = []
            to_install_packages = []

            for i, package in enumerate(packages):
                if self.cancel_installation_flag:
                    break

                self.message_queue.put((f"正在检测第 {i+1}/{total} 个包: {package}", "info"))

                # 使用新的检查方法
                if self.check_package_installed(package):
                    installed_packages.append(package)
                    self.message_queue.put((f"{package} 已经安装，无需重复安装", "info"))
                else:
                    to_install_packages.append(package)
                    self.message_queue.put((f"{package} 需要安装", "info"))

                self.root.update()

            # 显示统计信息
            self.message_queue.put(("\n" + "="*50, "info"))
            self.message_queue.put(("\n检测完成：", "info"))
            self.message_queue.put((f"- 已安装的包：{len(installed_packages)}个", "info"))
            self.message_queue.put((f"- 需要安装的包：{len(to_install_packages)}个", "info"))
            self.message_queue.put(("="*50 + "\n", "info"))

            if not to_install_packages:
                self.message_queue.put(("\n" + "="*50, "info"))
                self.message_queue.put(("\n所有包都已安装，无需安装新包", "success"))
                self.message_queue.put(("="*50 + "\n", "info"))
                self.installation_running = False
                self.total_progress['value'] = 0
                self.total_label['text'] = "总进度: 0%"
                self.cancel_btn.grid_remove()
                self.install_all_btn['state'] = 'normal'
                self.install_selected_btn['state'] = 'normal'
                self.uninstall_btn['state'] = 'normal'
                self.check_updates_btn['state'] = 'normal'
                self.update_requirements_btn['state'] = 'normal'
                return

            # 添加3秒倒计时
            self.message_queue.put(("3秒后开始安装...", "info"))
            for i in range(3, 0, -1):
                if self.cancel_installation_flag:
                    break
                self.message_queue.put((f"{i}...", "info"))
                time.sleep(1)
                self.root.update()
            self.message_queue.put(("="*50 + "\n", "info"))

            if self.cancel_installation_flag:
                self.message_queue.put(("\n" + "="*50, "info"))
                self.message_queue.put(("\n安装已取消\n", "info"))
                self.message_queue.put(("="*50 + "\n", "info"))
                self.installation_running = False
                self.total_progress['value'] = 0
                self.total_label['text'] = "总进度: 0%"
                self.cancel_btn.grid_remove()
                self.install_all_btn['state'] = 'normal'
                self.install_selected_btn['state'] = 'normal'
                self.uninstall_btn['state'] = 'normal'
                self.check_updates_btn['state'] = 'normal'
                self.update_requirements_btn['state'] = 'normal'
                return

            # 开始安装需要安装的包
            self.message_queue.put(("开始安装依赖包...", "info"))
            self.message_queue.put(("="*50 + "", "info"))
            failed_packages = []
            total_to_install = len(to_install_packages)
            self.total_progress['maximum'] = total_to_install
            self.total_progress['value'] = 0

            for i, package in enumerate(to_install_packages):
                if self.cancel_installation_flag:
                    break

                self.total_progress['value'] = i
                self.total_label['text'] = f"总进度: {int((i/total_to_install)*100)}%"
                self.message_queue.put((f"\n正在安装第 {i+1}/{total_to_install} 个包: {package}", "info"))
                self.root.update()

                if not self.install_package(package):
                    failed_packages.append(package)

                if self.cancel_installation_flag:
                    break

                self.root.update()

            self.installation_running = False
            self.total_progress['value'] = 0
            self.total_label['text'] = "总进度: 0%"
            self.cancel_btn.grid_remove()
            self.install_all_btn['state'] = 'normal'
            self.install_selected_btn['state'] = 'normal'
            self.uninstall_btn['state'] = 'normal'
            self.check_updates_btn['state'] = 'normal'
            self.update_requirements_btn['state'] = 'normal'

            if self.cancel_installation_flag:
                self.message_queue.put(("\n" + "="*50, "info"))
                self.message_queue.put(("\n安装已取消\n", "info"))
                self.message_queue.put(("="*50 + "\n", "info"))
            else:
                self.message_queue.put(("\n" + "="*50, "info"))
                if failed_packages:
                    self.message_queue.put(("\n安装完成，以下包安装失败：", "error"))
                    for package in failed_packages:
                        self.message_queue.put((f"- {package}", "error"))
                else:
                    self.message_queue.put(("\n所有需要安装的包安装完成！", "success"))
                    # 自动更新requirements.txt
                    self.update_requirements()
                self.message_queue.put(("="*50 + "\n", "info"))

        threading.Thread(target=install_thread, daemon=True).start()

    def install_selected(self):
        selected = self.package_listbox.curselection()
        if not selected:
            messagebox.showwarning("警告", "请先选择要安装的包")
            return

        def install_thread():
            packages = [self.package_listbox.get(i) for i in selected]
            total = len(packages)
            self.total_progress['maximum'] = total
            self.total_progress['value'] = 0

            failed_packages = []  # 记录安装失败的包

            for i, package in enumerate(packages):
                self.total_progress['value'] = i
                self.total_label['text'] = f"总进度: {int((i / total) * 100)}%"
                self.root.update()

                if not self.install_package(package):
                    failed_packages.append(package)

                self.root.update()

            self.total_progress['value'] = 0
            self.total_label['text'] = "总进度: 0%"

            if failed_packages:
                self.message_queue.put(("安装完成，以下包安装失败：", "error"))
                for package in failed_packages:
                    self.message_queue.put((f"- {package}", "error"))
            else:
                self.message_queue.put(("选中的包安装完成！", "success"))
                # 自动更新requirements.txt
                self.update_requirements()

        threading.Thread(target=install_thread, daemon=True).start()

    def uninstall_selected(self):
        selected = self.installed_listbox.curselection()
        if not selected:
            messagebox.showwarning("警告", "请先选择要卸载的包")
            return

        def uninstall_thread():
            packages = [self.installed_listbox.get(i) for i in selected]
            total = len(packages)
            self.total_progress['maximum'] = total
            self.total_progress['value'] = 0

            for i, package in enumerate(packages):
                self.total_progress['value'] = i
                self.total_label['text'] = f"总进度: {int((i / total) * 100)}%"
                self.root.update()

                self.uninstall_package(package)

                self.root.update()

            self.total_progress['value'] = 0
            self.total_label['text'] = "总进度: 0%"
            self.message_queue.put(("选中的包卸载完成！", "success"))

        threading.Thread(target=uninstall_thread, daemon=True).start()

    def check_updates(self):
        def check_thread():
            self.message_queue.put(("正在检查可用的更新...", "info"))
            result = subprocess.run(
                [sys.executable, "-m", "pip", "list", "--outdated"],
                capture_output=True,
                text=True
            )

            if result.returncode == 0:
                outdated_packages = [line.split()[0] for line in result.stdout.split('\n')[2:] if line.strip()]
                if outdated_packages:
                    self.message_queue.put((f"发现 {len(outdated_packages)} 个包可以更新:", "info"))
                    for package in outdated_packages:
                        self.message_queue.put((f"- {package}", "info"))

                    # 创建更新选择对话框
                    update_window = tk.Toplevel(self.root)
                    update_window.title("选择要更新的包")
                    update_window.geometry("500x500")

                    # 创建说明标签
                    ttk.Label(update_window, text="请选择要更新的包：").pack(pady=5)

                    # 创建选择框
                    select_all_var = tk.BooleanVar()
                    select_all_cb = ttk.Checkbutton(update_window, text="全选", variable=select_all_var,
                                                    command=lambda: self.toggle_all(select_all_var, listbox))
                    select_all_cb.pack(pady=5)

                    # 创建包列表
                    listbox = tk.Listbox(update_window, selectmode=tk.MULTIPLE, height=15)
                    listbox.pack(pady=10, fill=tk.BOTH, expand=True)

                    for package in outdated_packages:
                        listbox.insert(tk.END, package)

                    # 创建按钮框架
                    button_frame = ttk.Frame(update_window)
                    button_frame.pack(pady=10)

                    # 创建更新按钮
                    def update_selected():
                        selected = listbox.curselection()
                        if not selected:
                            messagebox.showwarning("警告", "请先选择要更新的包")
                            return

                        packages = [listbox.get(i) for i in selected]
                        for package in packages:
                            self.install_package(package, update=True)
                        update_window.destroy()

                    def update_all():
                        for package in outdated_packages:
                            self.install_package(package, update=True)
                        update_window.destroy()

                    def cancel_update():
                        update_window.destroy()

                    # 添加按钮
                    ttk.Button(button_frame, text="更新选中项", command=update_selected).pack(side=tk.LEFT, padx=5)
                    ttk.Button(button_frame, text="一键更新所有", command=update_all).pack(side=tk.LEFT, padx=5)
                    ttk.Button(button_frame, text="取消更新", command=cancel_update).pack(side=tk.LEFT, padx=5)
                else:
                    self.message_queue.put(("所有包都是最新版本！", "success"))
            else:
                self.message_queue.put(("检查更新失败", "error"))

        threading.Thread(target=check_thread, daemon=True).start()

    def toggle_all(self, var, listbox):
        if var.get():
            listbox.select_set(0, tk.END)
        else:
            listbox.select_clear(0, tk.END)

    def update_requirements(self):
        def update_thread():
            self.message_queue.put(("正在更新 requirements.txt...", "info"))
            result = subprocess.run(
                [sys.executable, "-m", "pip", "freeze"],
                capture_output=True,
                text=True
            )

            if result.returncode == 0:
                with open('requirements.txt', 'w') as f:
                    f.write(result.stdout)
                self.message_queue.put(("requirements.txt 更新成功", "success"))
                self.load_packages()  # 重新加载包列表
            else:
                self.message_queue.put(("requirements.txt 更新失败", "error"))

        threading.Thread(target=update_thread, daemon=True).start()

    def cancel_installation(self):
        if self.installation_running:
            self.cancel_installation_flag = True
            self.message_queue.put(("正在取消安装...", "info"))
            self.cancel_btn.grid_remove()
            self.install_all_btn['state'] = 'normal'
            self.install_selected_btn['state'] = 'normal'
            self.uninstall_btn['state'] = 'normal'
            self.check_updates_btn['state'] = 'normal'
            self.update_requirements_btn['state'] = 'normal'


def main():
    root = tk.Tk()
    app = DependencyInstaller(root)

    # 配置文本标签样式
    app.output_text.tag_configure("error", foreground="red")
    app.output_text.tag_configure("success", foreground="green")

    root.mainloop()


if __name__ == "__main__":
    main()