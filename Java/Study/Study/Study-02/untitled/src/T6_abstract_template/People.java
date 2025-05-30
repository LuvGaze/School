package T6_abstract_template;

public abstract class People {
    public void write() {
        System.out.println("\t\t\t\t\t《***》");
        System.out.println("\t\t开头");
        System.out.println(writeMain());
        System.out.println("结尾");
    }

    public abstract String writeMain();
}
