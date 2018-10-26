
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>

<body>
<a href="#list-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>


<div class="container-fluid">
    <nav class="navbar navbar-dark bg-success">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand"><g:message code="default.list.label" args="[entityName]"/></a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse-2">
                <ul class="nav navbar-nav navbar-right">
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>

                </ul>
            </div>
        </div>
    </nav>
</div>

<div id="list-post" class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:table collection="${postList}"/>
    <g:each in="${posts}" var="data" status="i">

        <div class="container">
            <div class="well">
                <div class="media">
                    <a class="pull-left" href="#">
                        <img class="media-object" src="http://placekitten.com/150/150">
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading">${"titulo: " + data.title}</h4>
                        <p class="text-left">By ${"usuario: " + usernames.get(data.userId)}</p>
                        <p>${"post: " + data.body}</p>

                        <ul class="text-right">
                            <li><a href="#"><i class="glyphicon glyphicon-comment text-right"></i> 5 comments</a></li>

                        </ul>

                    </div>
                </div>
            </div>
        </div>s

    </g:each>
    <div class="pagination">
        <g:paginate total="${postCount ?: 0}"/>
    </div>
</div>
</body>
</html>