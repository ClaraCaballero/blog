import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import grails.plugins.rest.client.RestBuilder;
import grails.plugins.rest.client.RestResponse;
import org.grails.web.json.JSONElement;

//https://jsonplaceholder.typicode.com/
public class BlogServiceImpl {
    private String API_PATH = "https://jsonplaceholder.typicode.com";

    private RestBuilder clienteRest;

    public BlogServiceImpl() {
        clienteRest = new RestBuilder();
    }

    public JSONElement getPosts() {
        final RestResponse response = clienteRest.get(API_PATH + "/posts");
        JSONElement posts= response.getJson();
        return posts;
    }

    public JSONElement getPost(int id) {
        final RestResponse response = clienteRest.get(API_PATH + "/posts/" + id);
        JSONElement post= response.getJson();
        return post;
    }

    public JSONElement getUser(int id) {
        final RestResponse response = clienteRest.get(API_PATH + "/users/"+id);
        JSONElement user= response.getJson();
        return user;
    }

    public JSONElement getComments(int postId) {
        final RestResponse response = clienteRest.get(API_PATH + "/posts/"+postId+"/comments");
        JSONElement comments= response.getJson();
        return comments;
    }

    public JSONElement getAlbums() {
        final RestResponse response = clienteRest.get(API_PATH + "/albums");
        JSONElement albums= response.getJson();
        return albums;
    }

    public JSONElement getAlbum(int id) {
        final RestResponse response = clienteRest.get(API_PATH + "/albums/" + id);
        JSONElement album= response.getJson();
        return album;
    }

    public JSONElement getPhotos(int userId) {
        final RestResponse response = clienteRest.get(API_PATH + "/albums/"+userId+"/photos");
        JSONElement photos= response.getJson();
        return photos;
    }
}
