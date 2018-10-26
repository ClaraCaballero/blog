package blog

import sun.rmi.runtime.Log

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PostController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def blogService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def posts = blogService.getPosts()

        HashMap usernames = new HashMap()
        posts.each {
            if(usernames.get(it.userId)== null) {
                usernames.put(it.userId, (blogService.getUser(it.userId).name));
//                println(usernames.get(it.userId))
            }
        }
        respond Post.list(params), model: [postCount: Post.count(), posts: posts, usernames: usernames ]
    }

    def show(Post post) {
        def post1 = blogService.getPost(Integer.valueOf(params.get("id")))
        def comments = blogService.getComments(Integer.valueOf(params.get("id")))
        def user = blogService.getUser(Integer.valueOf(params.get("id")))
        respond Post.list(params), model: [comments: comments, post: post1, user: user]
    }

    def create() {
        respond new Post(params)
    }

    @Transactional
    def save(Post post) {
        Log.println(params.get("title"))
        if (post == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (post.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond post.errors, view: 'create'
            return
        }

        post.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'post.label', default: 'Post'), post.id])
                redirect post
            }
            '*' { respond post, [status: CREATED] }
        }
    }

    def edit(Post post) {
        respond post
    }

    @Transactional
    def update(Post post) {
        if (post == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (post.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond post.errors, view: 'edit'
            return
        }

        post.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'post.label', default: 'Post'), post.id])
                redirect post
            }
            '*' { respond post, [status: OK] }
        }
    }

    @Transactional
    def delete(Post post) {

        if (post == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        post.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'post.label', default: 'Post'), post.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'post.label', default: 'Post'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
