//Szabo Robert

package core;

public class Car {
    private String type;
    private Integer age;

    public Car(String type, Integer age) {
        this.type = type;
        this.age = age;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        type = type;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "Car " +
                "Type: " + type +
                ", age: " + age;
    }
}
