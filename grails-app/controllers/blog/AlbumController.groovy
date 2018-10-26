package blog

import sun.rmi.runtime.Log

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AlbumController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def blogService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def albums = blogService.getAlbums()
        HashMap usernames = new HashMap()
        albums.each {
            if (usernames.get(it.userId) == null) {
                usernames.put(it.userId, (blogService.getUser(it.userId).name));
            }
        }
        respond Album.list(params), model: [albumCount: Post.count(), albums: albums, usernames: usernames]
    }

    def show(Album album) {
        def photos = blogService.getPhotos(Integer.valueOf(params.get("id")))
        def album1 = blogService.getAlbum(Integer.valueOf(params.get("id")))
        def user = blogService.getUser(Integer.valueOf(params.get("id")))
        //     Log.println(album1)
        respond Album.list(params), model: [photos: photos, album: album1, user: user]
    }

    def create() {
        respond new Album(params)
    }

    @Transactional
    def save(Album album) {
        if (album == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (album.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond album.errors, view: 'create'
            return
        }

        album.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'album.label', default: 'Album'), album.id])
                redirect album
            }
            '*' { respond album, [status: CREATED] }
        }
    }

    def edit(Album album) {
        respond album
    }

    @Transactional
    def update(Album album) {
        if (album == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (album.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond album.errors, view: 'edit'
            return
        }

        album.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'album.label', default: 'Album'), album.id])
                redirect album
            }
            '*' { respond album, [status: OK] }
        }
    }

    @Transactional
    def delete(Album album) {

        if (album == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        album.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'album.label', default: 'Album'), album.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'album.label', default: 'Album'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
