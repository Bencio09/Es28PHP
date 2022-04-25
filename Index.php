<?php
include "./SQL/connessione.php";
?>

<html>

<head>
    <link rel="stylesheet" href="./CSS/bootstrap.css">
    <script src="./JS/bootstrap.js"></script>
    <title>AGENZIA IMMOBILIARE</title>
</head>

<body>
    <?php
    echo var_dump($_SERVER);
    ?>
    <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">
        <div class="card" style="width: 18rem;">
            <img src="..." class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>
    </form>
</body>

</html>