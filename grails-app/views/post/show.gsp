<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>

<body>
<a href="#show-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="container-fluid" style="margin-top: 10px ; margin-bottom: 20px">
    <nav class="navbar navbar-dark bg-success">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand"><g:message code="default.show.label" args="[entityName]"/></a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse-2">
                <ul class="nav navbar-nav navbar-right">
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>

                </ul>
            </div>
        </div>
    </nav>
</div>
<div class="container">
    <div class="well">
        <div class="media">
            <div class="media-body">
                <h1 class="media-heading">${"Titulo: " + post.title}</h1>
                <p class="text-left">By: ${user.name}</p>
                <p>${"Post: " + post.body}</p>
                <ul class="text-right">
                </ul>

            </div>
        </div>
    </div>
</div>

<h1><b>Commnets</b></h1>
<g:each in="${comments}" var="data" status="i">
    <div class="container">
        <div class="well">
            <div class="media">
                <div class="media-body">
                    <h4 class="media-heading">${"titulo: " + data.name}</h4>
                    <p>${"Comentario: " + data.body}</p>
                    <p>${"By: " + data.email}</p>
                </div>
            </div>
        </div>
    </div>
</g:each>

<div id="show-post" class="container-fluid scaffold-show" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:display bean="post" />
    <g:form resource="${this.post}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.post}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
