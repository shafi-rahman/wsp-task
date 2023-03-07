<!DOCTYPE html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>WSP - Client Search</title>
        <link href="{{url('/img/favicon.png')}}" rel="icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

        @vite(['resources/js/app.js', 'resources/css/app.css'])
        <style>
            .text-right{
                text-align: right !important;  
            }
        </style>
    </head>
    <body class="antialiased">
        
        <div id="app"></div>

        <footer id="footer" class="footer text-right fixed-bottom mb-3">
            <div class="container mt-4">
              <div class="copyright text-white">
                &copy; Copyright <strong><span>WSP</span></strong>. All Rights Reserved
              </div>
              <div class="credits text-white">
                Designed & Developed by <a href="#" style="text-decoration: none;" class="text-white">Shafi</a>
              </div>
            </div>
        </footer>
    </body>
</html>
