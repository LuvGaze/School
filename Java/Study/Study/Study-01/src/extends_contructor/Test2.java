package extends_contructor;

public class Test2 {
    public static void main(String[] args) {
        Teacher teacher = new Teacher("莫慧琳", 20, "美美哒");
    }
}

class Teacher extends people {
    private String skill;

    public Teacher(String name, int age, String skill) {
        super(name, age);
        this.skill = skill;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }
}

class people {
    private String name;
    private int age;


    public people() {
    }

    public people(String name, int age) {
        this.name = name;
        this.age = age;
    }

    /**
     * 获取
     *
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * 设置
     *
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取
     *
     * @return age
     */
    public int getAge() {
        return age;
    }

    /**
     * 设置
     *
     * @param age
     */
    public void setAge(int age) {
        this.age = age;
    }

    public String toString() {
        return "people{name = " + name + ", age = " + age + "}";
    }
}