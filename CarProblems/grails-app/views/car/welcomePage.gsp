
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">

    <title>CarProblems - welcome!</title>
</head>
<body>

        <div class="jumbotron">
            <h1>Welcome to CarProblems!</h1>
            <p>Buying pre-owned cars is a gamble. This application aims to provide its users community sourced information on typical mileage related car "health" issues.</p>
            <p><a class="btn btn-primary btn-lg" href="/CarProblems/example" role="button">See an example car</a></p>
        </div>

        <ul class="nav nav-tabs nav-justified">
                <li class="active"><a data-toggle="tab" href="#browsCars">Brows cars for problems</a></li>

            <sec:ifNotLoggedIn>
                <li><a data-toggle="tab" href="#logInTab">Log in</a></li>
            </sec:ifNotLoggedIn>

        </ul>


        <div class="tab-content">

            <div id="browsCars" class="tab-pane fade in active">

                <div class="center-block col-md-4" style="float: none;">
                    <hr>
                    <div class="well well-lg">


                        <h2>Select car model</h2>

                            <g:form class="form-horizontal" action='carProfile'  method="GET" >

                                <fieldset>
                                    <div class="form-group">
                                        <div class="fieldcontain">
                                            <g:select id="car" name="id" from="${cscie56.fp.Car.list()}" optionKey="id" required="" value="${params.id}" class=""/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <button class="btn btn-primary" type='submit' id="car">GO</button>
                                    </div>

                                </fieldset>

                            </g:form>

                    </div>
                </div>

            </div>

            <sec:ifNotLoggedIn>
            <div id="logInTab" class="tab-pane fade">

                <div class="center-block col-md-4" style="float: none;">
                <hr>
                    <div class="well well-lg">

                        <h2>Log in</h2>

                        <div id='login'>

                                <form class="form-horizontal" action='/CarProblems/j_spring_security_check' method='POST' id='loginForm'  autocomplete='off'>
                                    <fieldset>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for='username'>Username:</label>
                                            <div class="col-md-8">
                                            <input type='text' class='text_' name='j_username' id='username'/>
                                                </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for='password'>Password:</label>
                                            <div class="col-md-8">
                                            <input type='password' class='text_' name='j_password' id='password'/>
                                                </div>
                                        </div>

                                        <div class="form-group" id="remember_me_holder">
                                            <label class="col-md-4 control-label" for='remember_me'>Remember me</label>
                                            <div class="col-md-8">
                                            <input type='checkbox' class='chk' name='_spring_security_remember_me' id='remember_me' />
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <div class="col-md-4"></div>
                                            <div class="col-md-8">
                                            <button class="btn btn-primary" type='submit' id="submit">Login</button>
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>

                        </div>
                        <script type='text/javascript'>
                            (function() {
                                document.forms['loginForm'].elements['j_username'].focus();
                            })();
                        </script>
                    </div>
                </div>

            </div>
            </sec:ifNotLoggedIn>

        </div>







</body>
</html>