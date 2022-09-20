<!DOCTYPE html>
<html lang="pl">
    <head>
        <meta charset="utf-8" />

        <title></title>

        <link rel="stylesheet" href="css/master.css" type="text/css" />
    </head>

    <body>
         
        <header class="site-bar">
            <h2 class="section-title--large">
                Szkoła Nauk Ścisłych im. Pitagorasa we Wrocławiu
            </h2>
        </header>
       
        <main class="site-section site-section__layer site-section__wrapper">
            <?php
                    //połączenie z bazą school
                    $conn="mysql:host=localhost;port=3307;dbname=school2";
                    $pdo= new PDO($conn,"root","");
                                        
                   
            ?>
            <section class="flex-column flex-column--2">
               <div class="subsection subsection__header">
                    <span class="subsection-title">
                    Pierwsza grupa</br>
                    <span class="subsection-content">
                    Opiekun:
                    <?php
                     //Zapytanie do bazy o grupy
                    //$loading = $pdo->prepare('SELECT name, surname FROM `teachers` WHERE teacherID=1;');  
                    $loading = $pdo->prepare('SELECT teachers.name, teachers.surname FROM `teachers`INNER JOIN groups ON teachers.teacherID=groups.teacherID WHERE groups.groupID=1;');
                    $loading->execute();
                    $row=$loading->fetch();
                    echo $row['name']." ". $row['surname'];
                    ?>
                    </span>
                        <br>
                        Uczniowie
                        <a href="https://dlapiperfuture.com/"><img src="img/deko/plus.png" class="subsection-title__plus"></a>
                    </span>
                    <?php
                     //Zapytanie do bazy o grupy
                    $loading = $pdo->prepare('SELECT name, surname  FROM students WHERE groupID=1');  
                    $loading->execute();
                                      
                    //Wyświetlanie grup
                    while ($row=$loading->fetch()){ 
                        echo '<div class="subsection-content"><div class="subsection-content__left">'.$row['name']." ". $row['surname'].'</div><div class="subsection-content__right"><a class="accent" href="grupa.php">Edytuj</a></div>
                        <div class="subsection-content__right"><a class="accent" href="https://www.wp.pl/">Usuń</a></div></div>';
                    }
                    ?>
                </div>
               
            </section>
            <section>
                <img src="img/deko/pitagoras.jpg">
            </section>
        </article>
      
    </body>
</html>