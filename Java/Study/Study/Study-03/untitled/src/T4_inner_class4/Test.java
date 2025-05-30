package T4_inner_class4;

/**
 * 匿名内部类使用场景
 */

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Test {
    public static void main(String[] args) {
        //  GUI
        //  创建窗口
        JFrame window = new JFrame("测试窗口");

        //  创建按钮
        JButton button = new JButton("测试");
//        按钮添加响应
        button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                System.out.println("按钮被点击了");
                JOptionPane.showMessageDialog(window, "按钮被点击了");
            }
        });

        //  创建桌面
        JPanel panel = new JPanel();

        //  窗口添加桌面
        window.add(panel);

        //  在桌面添加按钮
        panel.add(button);
        //  调制按钮在桌面的位置
        button.setSize(300, 100);

        //  窗口大小
        window.setSize(600, 600);

        window.setLocationRelativeTo(null);

        //  关闭窗口
        window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        //  显示窗口
        window.setVisible(true);
    }
}
