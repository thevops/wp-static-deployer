# wp-static-deployer
Script for generate static WordPress website

### wp-static-deployer.sh

Pobiera stronę wget'em do ustalonego katalogu.


### wp-static-deployer-partial.sh

Bardziej rozbudowana wersja. Działa w dwóch trybach:

1. Pobiera URLe do pliku.
2. Pobiera ustaloną liczbę plików z adresów zachowanych w poprzednim kroku. Uruchomienie kilka razy w końcu pobierze stronę.

### Problemy
Jeśli linki na stronie są w formatach www.domena.pl i bez www to warto uruchomić skrypt także dla obu wersji.
Dodatkowo na końcu można sprawdzić czy jakieś pliki zawierają jeszcze adres domeny poprzed grep -Rl -F "http://domena.pl/"
(z www także). I potem sed'em zamienić usunać adresy: sed -i 's/http:\/\/domena.pl//g' plik
