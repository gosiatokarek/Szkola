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
            
            <section class="flex-column flex-column--2">

                <!---------Grupy-->

                <div class="subsection subsection__header">
                    <span class="subsection-title">
                        Grupy
                        <a href="https://dlapiperfuture.com/"><img src="img/deko/plus.png" class="subsection-title__plus"></a>
                    </span>
                </div>
                <?php
                    //połączenie z bazą school
                    $conn="mysql:host=localhost;port=3307;dbname=school2";
                    $pdo= new PDO($conn,"root","");
                                        
                    //Zapytanie do bazy o grupy
                    $loading = $pdo->prepare('SELECT name FROM groups');  
                    $loading->execute();
                                      
                    //Wyświetlanie grup
                    while ($row=$loading->fetch()){ 
                        echo '<div class="subsection-content"><div class="subsection-content__left">'.$row['name'].'</div><div class="subsection-content__right"><a class="accent" href="grupa.php">Edytuj</a></div>
                        <div class="subsection-content__right"><a class="accent" href="https://www.wp.pl/">Usuń</a></div></div>';
                    }
                     
                ?>


                <!---------Nauczyciele-->
                <div class="subsection subsection__header">
                    <span class="subsection-title">Nauczyciele</span>
                    <a href="https://dlapiperfuture.com/"><img src="img/deko/plus.png" class="subsection-title__plus"></a>
                </div>
                <div class="subsection-content">
                    <div class="subsection-content__left"> Waldemar Abacki</div>
                    <div class="subsection-content__right"><a class="accent" href="https://www.onet.pl/">Edytuj</a></div>
                    <div class="subsection-content__right"><a class="accent" href="https://www.wp.pl/">Usuń</a></div>
                </div>
                <div class="subsection-content">
                    <div class="subsection-content__left"> Mirosław Bracki</div>
                    <div class="subsection-content__right"><a class="accent" href="https://www.onet.pl/">Edytuj</a></div>
                    <div class="subsection-content__right"><a class="accent" href="https://www.wp.pl/">Usuń</a></div>
                </div>

                <div class="subsection-content">
                    <div class="subsection-content__left"> Katarzyna Cudna-Kłos</div>
                    <div class="subsection-content__right"><a class="accent" href="https://www.onet.pl/">Edytuj</a></div>
                    <div class="subsection-content__right"><a class="accent" href="https://www.wp.pl/">Usuń</a></div>
                </div>

                <div class="subsection-content">
                    <div class="subsection-content__left"> Jolanta Korzeniowska</div>
                    <div class="subsection-content__right"><a class="accent" href="https://www.onet.pl/">Edytuj</a></div>
                    <div class="subsection-content__right"><a class="accent" href="https://www.wp.pl/">Usuń</a></div>
                </div>



                <!---------Uczniowie-->
                <div class="subsection subsection__header">
                    <span class="subsection-title">Uczniowie</span>
                    <a href="https://dlapiperfuture.com/"><img src="img/deko/plus.png" class="subsection-title__plus"></a>
                </div>

                <div class="subsection-content">
                    <div class="subsection-content__left"> Dagmara Domaszewska</div>
                    <div class="subsection-content__right"><a class="accent" href="https://www.wp.pl/">Edytuj</a></div>
                    <div class="subsection-content__right"><a class="accent" href="https://www.wp.pl/">Usuń</a></div>
                </div>
                <div class="subsection-content">
                    <div class="subsection-content__left"> Stanisław Nowowiejski</div>
                    <div class="subsection-content__right"><a class="accent" href="https://www.wp.pl/">Edytuj</a></div>
                    <div class="subsection-content__right"><a class="accent" href="https://www.wp.pl/">Usuń</a></div>
                </div>

                <div class="subsection-content">
                    <div class="subsection-content__left"> Edward Romanczykiewicz</div>
                    <div class="subsection-content__right"><a class="accent" href="https://www.wp.pl/">Edytuj</a></div>
                    <div class="subsection-content__right"><a class="accent" href="https://www.wp.pl/">Usuń</a></div>
                </div>

                <div class="subsection-content">
                    <div class="subsection-content__left"> Małgorzata Wiśniewska</div>
                    <div class="subsection-content__right"><a class="accent" href="https://www.wp.pl/">Edytuj</a></div>
                    <div class="subsection-content__right"><a class="accent" href="https://www.wp.pl/">Usuń</a></div>
                </div>
            </section>
            <section class="flex-column flex-column--4">
                
                <img src="img/deko/pitagoras.jpg" class="subsection_img">
            </section>
        </main>
        <footer class="site-bar">
           
                <div class="subsection-content subsection-content--footer">
                    <div class="subsection-content__left--footer"> Kontakt:</div>
                    <div class="subsection-content__right--footer">
                        <a  href="mailto:pitagoras@edu.wroc.pl" class="footer-a"><img src="img/deko/poczta.png" class="footer-img"> pitagoras@edu.wroc.pl</a>
                    </div>
                    <div class="subsection-content__right--footer">
                        <a  href="https:tel:123456789" class="footer-a"><img src="img/deko/tel.png" class="footer-img">123456789</a>
                    </div>
                </div>

           
        </footer>
    </body>
</html>n