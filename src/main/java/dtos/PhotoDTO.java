package dtos;

public class PhotoDTO extends BaseDTO{
    private String _title;
    private String _url;
    private String _thumbnailUrl;
    private AlbumDTO _album;

    public String get_title() {
        return _title;
    }

    public String get_url() {
        return _url;
    }

    public String get_thumbnailUrl(){return _thumbnailUrl;}

    public AlbumDTO get_user() {
        return _album;
    }

    public void set_title(String _title) {
        this._title = _title;
    }

    public void set_url(String _body) {
        this._url = _body;
    }

    public void set_thumbnailUrl(String _thumbnailUrl) {this._thumbnailUrl = _thumbnailUrl;}

    public void set_user(AlbumDTO _album) {
        this._album = _album;
    }

}
