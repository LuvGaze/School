package demo;

/**
 * 作者：张国斌
 * 描述：永无BUG
 */
public class User {
    int id;
    String name;
    String pwd;

    public User() {

    }

    public User(int id) {
        this.id = id;
    }

    public User(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public User(int id, String name, String pwd) {
        this.id = id;
        this.name = name;
        this.pwd = pwd;

    }

    public static void main(String[] args) {
        User u = new User();
        User u1 = new User(4567);
        User u2 = new User(1234, "qwe");
        User u3 = new User(5678, "rty", "uiop");
        System.out.println(u.id);
        System.out.println(u1.id);
        System.out.println(u2.id + "  " + u2.name);
        System.out.println(u3.id + "  " + u3.name + "  " + u3.pwd);

    }
}
