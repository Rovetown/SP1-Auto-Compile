#!/bin/bash

# Überprüfen, ob der Dateiname als Parameter angegeben wurde
if [ $# -eq 0 ]; then
  echo "Bitte geben Sie den Dateinamen als Parameter an."
  exit 1
fi

# Überprüfen, ob die angegebene Datei existiert
if [ ! -f "$1" ]; then
  echo "Die angegebene Datei existiert nicht."
  exit 1
fi

# Extrahieren des Verzeichnisses aus dem Dateinamen
directory=$(dirname "$1")

# Kompilieren der angegebenen Datei mit den gcc-Parametern
gcc -std=c11 -pedantic -Wall -Werror -D_XOPEN_SOURCE=700 "$1" -o "${1%.*}"

# Überprüfen, ob die Kompilierung erfolgreich war (gibt Verzeichnis und Dateiname an)
if [ $? -eq 0 ]; then
  echo "Kompilierung erfolgreich! Das ausführbare Programm befindet sich im Verzeichnis: $directory mit dem Namen: $(basename "$1" .c)"
else
  echo "Fehler beim Kompilieren."
fi
