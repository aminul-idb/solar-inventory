<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Japan Solar Tech"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    %{--<asset:stylesheet src="application.css"/>--}%
    <asset:javascript src="application.js"/>

    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="font-awesome.css"/>
    <asset:stylesheet src="style.css"/>
    <asset:javascript src="bootstrap.min.js"/>
    %{--<asset:javascript src="jquery-1.10.2.js"/>--}%
    <asset:javascript src="jquery.metisMenu.js"/>
    <asset:javascript src="inspinia.js"/>

    <g:layoutHead/>

    <style>
    html, body, .container, .content {
        height: 100%;
    }

    .container, .content {
        position: relative;
    }

    .proper-content {
        padding-top: 40px; /* >= navbar height */
    }

    .wrapper {
        min-height: 100%;
        height: auto !important;
        height: 100%;
        margin: 0 auto -50px; /* same as the footer */
    }

    .push {
        height: 50px; /* same as the footer */
    }
    .footer-wrapper {
        position: relative;
        height: 50px;
    }
    #footer {
        background-color:#064244;
    }
    </style>

</head>
<body>

<div class="wrapper">

        <g:render template='/header'/>

        <g:render template='/leftMenu'/>


       <g:layoutBody />

      <g:render template='/footer'/>
</body>
</html>
