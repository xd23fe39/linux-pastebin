[IMG001]: res/md.png
[LNK001]: ../../README.md
[LNK002]: xd23fe39@yahoo.de

* * *

# Issue 17/002

Dieses Dokument ist Teil der [Technical Notes][LNK001] von [xd23fe39][LNK002].

## Titel

Neues Git-Projekt auf github.com starten.

## Beschreibung

Das Projekt **technical-notes** wurde auf github.com angelegt und soll nun mit
einem lokalen Projektordner *verknüpft* werden.

## Lösung

>Bitte ersetzen Sie die u.a. URL durch ihre Eigene. Die URL wird im
>Projektverzeichnis auf github.com angezeigt.

#### Create a new repository on the command line

  ```
  echo "# technical-notes" >> README.md
  git init
  git add README.md
  git commit -m "first commit"
  git remote add origin https://github.com/xd23fe39/technical-notes.git
  git push -u origin master
  ```

#### Push an existing repository from the command line

  ```
  git remote add origin https://github.com/xd23fe39/technical-notes.git
  git push -u origin master
  ```

### Links

- https://help.github.com/
- https://github.com/xd23fe39/technical-notes
- <https://help.github.com/articles/set-up-git/>
