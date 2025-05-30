package Student;

public class Test {
    public static void main(String[] args) {
        Student[] arr = new Student[3];

        Student stu1 = new Student(1, "莫慧琳", 20);
        Student stu2 = new Student(2, "张国斌", 21);
        Student stu3 = new Student(3, "琳琳莫", 19);

        arr[0] = stu1;
        arr[1] = stu2;
        arr[2] = stu3;

        Student stu4 = new Student(4, "斌国张", 20);

        boolean flag = contain(arr, stu4.getId());
        if (flag) {
            System.out.println("当前id重复，请修改id后再进行添加");
        } else {
            int count = getCount(arr);
            if (count == arr.length) {
                Student[] newArr = CreatNewArr(arr);
                newArr[count] = stu4;
                print(newArr);
            } else {
                arr[count] = stu4;
                print(arr);
            }
        }

        System.out.println("======================");

        int index = getIndex(arr, 2);
        if (index >= 0) {
            arr[index] = null;
            print(arr);
        } else {
            System.out.println("当前id不存在，删除失败");
        }

        System.out.println("======================");

        index = getIndex(arr, 1);
        if (index >= 0) {
            int newAge = arr[index].getAge() + 1;
            arr[index].setAge(newAge);
            print(arr);
        } else {
            System.out.println("当前id不存在，修改失败");
        }
    }

    public static int getIndex(Student[] arr, int id) {
        for (int i = 0; i < arr.length; i++) {
            Student stu = arr[i];
            if (stu != null) {
                int sid = stu.getId();
                if (sid == id) {
                    return i;
                }
            }
        }
        return -1;
    }

    public static void print(Student[] arr) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] != null) {
                System.out.println(arr[i].getId() + " " + arr[i].getName() + " " + arr[i].getAge());
            }
        }
    }

    public static Student[] CreatNewArr(Student[] arr) {
        Student[] newArr = new Student[arr.length + 1];
        for (int i = 0; i < arr.length; i++) {
            newArr[i] = arr[i];
        }
        return newArr;
    }

    public static int getCount(Student[] arr) {
        int count = 0;
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] != null) {
                count++;
            }
        }
        return count;
    }

    public static boolean contain(Student[] arr, int id) {
        for (int i = 0; i < arr.length; i++) {
            Student stu = arr[i];
            if (stu != null) {
                int sid = stu.getId();
                if (sid == id) {
                    return true;
                }
            }
        }
        return false;
    }
}