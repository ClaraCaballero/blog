
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'album.label', default: 'Album')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>

<body>
<a href="#list-album" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>


<div class="container-fluid" style="margin-top: 10px">
    <nav class="navbar bg-success">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand"><g:message code="default.list.label" args="[entityName]"/></a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse-2">
                <ul class="nav navbar-nav navbar-right">
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link href="#"><g:message code="default.new.label" args="[entityName]"/></g:link></li>

                </ul>
            </div>
        </div>
    </nav>
</div>

<div id="list-album" class="content scaffold-list" role="main" style="margin-top: 20px">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:table collection="${albumList}"/>
    <g:each in="${albums}" var="data" status="i">

        <div class="container">
            <div class="well">
                <div class="media">
                    <div class="media-body">
                        <h4 class="media-heading">${"Titulo: " + data.title}</h4>
                        <p class="text-left">By: ${usernames.get(data.userId)}</p>
                        <ul class="text-right">
                            <g:link controller="Album" action="show" id="${data.id}">View photos</g:link>
                        </ul>

                    </div>
                </div>
            </div>
        </div>

    </g:each>
    <div class="pagination">
        <g:paginate total="${albumCount ?: 0}"/>
    </div>
</div>
</body>
</html>