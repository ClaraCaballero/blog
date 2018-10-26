package dtos;

import java.io.Serializable;

public abstract class BaseDTO implements Serializable {
    private int _id;

    public void setId(int id) {
        _id = id;
    }

    public int getId() {
        return _id;
    }
}
