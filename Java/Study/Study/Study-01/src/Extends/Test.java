package Extends;

public class Test {
    public static void main(String[] args) {
        Teacher teacher = new Teacher();
        teacher.setName("莫慧琳");
        teacher.setSkill("唱歌");

        System.out.println(teacher.getName());
        System.out.println(teacher.getSkill());
        teacher.printInfo();
    }
}
