<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    </head>

    <body>
        <a href="#create-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>


    <div class="container-fluid" style="margin-top: 10px">
        <nav class="navbar bg-success" >
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand"><g:message code="default.create.label" args="[entityName]"/></a>
                </div>
                <div class="collapse navbar-collapse" id="navbar-collapse-2">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>

                    </ul>
                </div>
            </div>
        </nav>
    </div>

        <div id="create-post" class="content scaffold-create container-fluid" role="main">
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.post}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.post}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.post}" method="POST">
                <fieldset class="form">
                    <f:all bean="post"/>

                    <div class="container" style="margin-top: 20px">
                        <div class="row">
                            <form role="form" id="contact-form" class="contact-form">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="Name" autocomplete="off" id="Name" placeholder="Name">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="email" class="form-control" name="email" autocomplete="off" id="email" placeholder="Tittle">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <textarea class="form-control textarea" rows="3" name="Message" id="Message" placeholder="Post"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <button name="create" type="submit" class=" save btn main-btn pull-right btn-success" >${message(code: 'default.button.create.label', default: 'Create')}</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </fieldset>
                %{--<fieldset class="buttons">--}%
                    %{--<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />--}%
                %{--</fieldset>--}%
            </g:form>
        </div>
    </body>
</html>
