//Szabo Robert

package collection;
import core.*;
public class Entry {
    private Integer key;
    private Car value;
    private Entry next;

    public Entry(Integer key, Car value) {
        this.key = key;
        this.value = value;
        next = null;
    }

    public Integer getKey() {
        return key;
    }

    public void setKey(Integer key) {
        this.key = key;
    }

    public Car getValue() {
        return value;
    }

    public void setValue(Car value) {
        this.value = value;
    }

    public Entry getNext() {
        return next;
    }

    public void setNext(Entry next) {
        this.next = next;
    }
}
