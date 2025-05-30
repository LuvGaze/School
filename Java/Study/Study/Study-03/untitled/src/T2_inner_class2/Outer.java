package T2_inner_class2;

public class Outer {
    private int age;
    public static String schemaName;

    public static class Inner {
        public static int a;
        private String name;

        public void test() {
            System.out.println("Inner.test");
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
    }

    public static void test2() {
        System.out.println(schemaName);
//        System.out.println(age);
    }
}
