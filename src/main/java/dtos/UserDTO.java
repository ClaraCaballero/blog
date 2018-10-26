package dtos;

public class UserDTO extends BaseDTO {

    public String getUser(){
        return _user;
    }

    public void setUser(String user){
        _user = user;
    }

String _user;
}
