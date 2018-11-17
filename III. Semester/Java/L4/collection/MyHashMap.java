//Szabo Robert

package collection;
import core.*;

public class MyHashMap {
    private Integer denominator;
    private Entry[] bucket;


    public MyHashMap(Integer denominator) {
        this.denominator = denominator;
        bucket = new Entry[denominator];
    }

    public void put(Integer a, Car c){
        Entry tmp = new Entry(a,c);
        tmp.setNext(bucket[hashFunction(a)]);
        bucket[hashFunction(a)] = tmp;
    }

    public Car get(Integer a){
        if (containsKey(a)) {
            Entry e = bucket[hashFunction(a)];
            while (e != null){
                if (e.getKey().equals(a))
                    return e.getValue();
                else
                    e=e.getNext();
            }
        }
        return null;
    }

    public Boolean containsKey(Integer a){
        Entry tmp = bucket[hashFunction(a)];
        while(tmp != null){
            if (tmp.getKey().equals(a))
                return true;
            else
                tmp = tmp.getNext();
        }
        return false;
    }

    private Integer hashFunction(Integer a){
        return a % denominator;
    }
}
