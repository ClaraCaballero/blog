package dtos;

public class AlbumDTO extends BaseDTO {
    private String _title;
    private UserDTO _user;

    public String get_title() {
        return _title;
    }

    public UserDTO get_user() {
        return _user;
    }

    public void set_title(String _title) {
        this._title = _title;
    }

    public void set_user(UserDTO _user) {
        this._user = _user;
    }
}
