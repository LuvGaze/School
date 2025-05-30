package T3_inner_class3;

public class Test2 {
    public static void main(String[] args) {
//        Swimming s = new Swimming(){
//            @Override
//            public void swim() {
//                System.out.println("猫游泳");
//            }
//        };
        test(new Swimming() {
            @Override
            public void swim() {
                System.out.println("猫游泳");
            }
        });
    }

    public static void test(Swimming s){
        System.out.println("test");
        s.swim();
    }
}

//class Cat implements Swimming{
//    @Override
//    public void swim() {
//
//    }
//}

interface Swimming {
    void swim();
}
