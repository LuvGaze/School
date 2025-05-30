package Phone.Test;

public class GirlFriendTest {
    public static void main(String[] args) {
        GirlFriend gf = new GirlFriend();
        GirlFriend gf2 = new GirlFriend();
        gf.setName("莫慧琳");
        gf.setAge(21);
        gf.setGender("萌妹子");

        gf2.setName("琳琳莫");
        gf2.setAge(20);
        gf2.setGender("萌妹子");

        System.out.println(gf.getName());
        System.out.println(gf.getAge());
        System.out.println(gf.getGender());
        System.out.println(gf2.getName());
        System.out.println(gf2.getAge());
        System.out.println(gf2.getGender());

        gf.eat();
        gf.sleep();
        gf2.eat();
        gf2.sleep();
    }
}
