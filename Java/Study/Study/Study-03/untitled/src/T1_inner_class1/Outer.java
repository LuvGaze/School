package T1_inner_class1;

public class Outer {
    public static String a;
    private int age=19;

    public void test2() {
        //  成员内部类可以直接访问外部类的成员
        System.out.println(age);
        System.out.println(a);
    }

    public class Inner {
        private String name;
        //public static String school;    // JDK16 开始支持静态内部类
        private int age = 21;

        public void test() {
            System.out.println(age);
            System.out.println(a);
            int age = 20;
            System.out.println(age);    //  20
            System.out.println(this.age);   //  21

            //  外部类名.this.成员变量
            System.out.println(Outer.this.age); //  19
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
    }
}
