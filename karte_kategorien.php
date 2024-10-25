<?php
    require("includes/config.inc.php");
    require("includes/common.inc.php");
    require("includes/db.inc.php");

    $conn = dbConnect();
    function zeigeMenu(?int $fid=null):void
    {
        global $conn;//because connection should be available inside of function
        
        if (is_null($fid)) {
            $where = "
                WHERE(
                    tbl_kategorien.FIDKategorie IS NULL
                )
            ";
        }else{
            $where = "
                WHERE(
                    tbl_kategorien.FIDKategorie = " .$fid. "
                )
            ";
        }

        $sql = "
            SELECT
                tbl_kategorien.Bezeichnung,
                tbl_kategorien.IDKategorie,
                tbl_kategorien.FIDKategorie,
                tbl_kategorien.Reihenfolge
            FROM tbl_kategorien
            " .$where. "
            ORDER BY tbl_kategorien.Reihenfolge ASC
        ";
        $kats = dbQuery($conn, $sql);
        while($kat = $kats->fetch_object()){

            if(is_null($kat->FIDKategorie))
            {
                echo('<h2>' .$kat->Bezeichnung);
                if ($kat->Bezeichnung == "Menü der Woche") {
                    $sql = "
                        SELECT
                            tbl_wochenmenue.gueltigVon,
                            tbl_wochenmenue.gueltigBis,
                            tbl_wochenmenue.Preis,
                            tbl_kategorien.Bezeichnung
                        FROM tbl_wochenmenue
                        LEFT JOIN tbl_kategorien ON tbl_wochenmenue.FIDKategorie = tbl_kategorien.IDKategorie
                    ";
                    $mDerWoche = dbQuery($conn, $sql)->fetch_object();
                    echo(' (' .date("d.m",strtotime($mDerWoche->gueltigVon)). ' bis ' .date("d.m.Y",strtotime($mDerWoche->gueltigBis)). ') - € ' .$mDerWoche->Preis);
                }
                echo('</h2>');
            }else{
                echo('<h3>' .$kat->Bezeichnung. '</h3>');
            }

            $sql = "
                SELECT
                    tbl_kategorien.Bezeichnung,
                    tbl_produkte.Anzahl,
                    tbl_produkte.Produkt,
                    tbl_produkte.Zusatztext,
                    tbl_einheiten.Einheit
                FROM tbl_produkte_kategorien
                JOIN tbl_kategorien ON tbl_kategorien.IDKategorie = tbl_produkte_kategorien.FIDKategorie
                JOIN tbl_produkte ON tbl_produkte.IDProdukt = tbl_produkte_kategorien.FIDProdukt
                JOIN tbl_einheiten ON tbl_einheiten.IDEinheit = tbl_produkte.FIDEinheit
                WHERE tbl_kategorien.Bezeichnung = '". $kat->Bezeichnung ."'"; 
            $produkte = dbQuery($conn, $sql);
            while ($prod = $produkte->fetch_object()) {
                echo('<ul>');
                echo('<li>' .$prod->Produkt. '</li>');
                echo('</ul>');
            }

            zeigeMenu($kat->IDKategorie);
        }
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Einträge</title>
    <style>
        h2,h3{
            text-decoration: underline dotted;
        }
    </style>
</head>
<body>
    <h1>Speisekarte</h1>
        <?php
            zeigeMenu();
        ?>
</body>
</html>