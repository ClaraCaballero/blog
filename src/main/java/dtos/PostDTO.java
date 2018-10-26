package dtos;

public class PostDTO extends BaseDTO {
    private String _title;
    private String _body;
    private UserDTO _user;

    public String get_title() {
        return _title;
    }

    public String get_body() {
        return _body;
    }

    public UserDTO get_user() {
        return _user;
    }

    public void set_title(String _title) {
        this._title = _title;
    }

    public void set_body(String _body) {
        this._body = _body;
    }

    public void set_user(UserDTO _user) {
        this._user = _user;
    }
}
