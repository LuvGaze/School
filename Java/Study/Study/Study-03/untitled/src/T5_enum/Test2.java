package T5_enum;

public class Test2 {
    public static void main(String[] args) {
        provideInfo(Constant.girl);
        provideInfo(Constant.boy);
    }

    public static void provideInfo(Constant sex){
        switch (sex){
            case girl:
                System.out.println("女");
                break;
            case boy:
                System.out.println("男");
                break;
            default:
                System.out.println("未知");
        }
    }
}
