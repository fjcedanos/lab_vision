# Warmup Questions

1.  What is the clone url of this repository?
      https://github.com/fjcedanos/lab_vision.git

2.  What is the output of the ``cal`` command?

Cal imprime el calendario del mes actual


# Homework Questions

1.  What is the ``grep``command?
    >   Es un buscador de palabras y expresiones dentro de uno o varios archivos 

2.  What is a *makefile*?
    >   Son formatos especiales de archivos que junto con make utility, pueden construir y manejar proyectos compilando todo lo que se hace.

3.  What is *git*?
    >   Sistema de control de versión, permite guardar cambios y recuperar versiones anteriores

4.  What does the ``-prune`` option of ``find`` do? Give an example
    >    -prune es una opción de find que además de buscar  archivos que coincidan, hace que find no busque en los subdirectorios. Si el comando contiene -prune, se asume por defecto -print.


5.  Where is the file ``xxxxxx``
    >   Se usa el comando find / -name 'xxxxxx' 2>/dev/null | wc -l y son 0 las coincidencias

6.  How many files with ``gnu`` in its name are in ``dir``
    > cd /usr/src
     find / -name '*gnu*' 2>/dev/null | wc -l 
La respuesta es: 656 archivos

7.  How many files contain ``gpl`` inside in ``dir``
    >   grep -rnw 'gpl' | wc -l
La respuesta es : 51


8.  What does the ``cut`` command do?
    >   Es un comando usado para la extracción de segmentos (o porciones) de las líneas de texto, provenientes de un archivo 

9.  What does the ``wget`` command do?
    >   Permite descargar archivos del internet

10.  What does the ``diff`` command do?
    >  diff --help
Compara archivos linea por linea 

11.  How many users exist in *Guitaca*?
    >   cut -d: -f1 /etc/passwd | wc -l
    Respuesta: 48 usuarios 

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    >  Para retornar una lista de usuarios y shells se usa el codigo cut, con las opciones f para encontrar un campo en una posicion especifica, y d para delimitar por ":". Por último se guardan las parejas en un archivo.
cut -d':' -f 1,7 /etc/passwd > prueba.txt

Para organizar las parejas alfabeticamente por shell. se usa Sort.  con la opción k para ignorar la primera columna y con t para delimitar por ":"
sort -k 2 -t':' prueba.txt


13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    >   cut -d':' -f 7 /etc/passwd |grep '/sbin/nologin' | wc -l
Respuesta: 41

14.  What is the name of the linux distribution running on *Guitaca*?
    >   cat /etc/issue
    Fedora release 20 (Heisenbug) 
Kernel \r on an \m (\l\

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github
fdupes -r Pictures/
3 duplicadas


16.What is the meaning of ``#! /bin/bash`` at the start of scripts?
    >es una conveción para que el Shell sepa que interpretador correr.

17. How many unique images are in the ``sipi_images`` folder?
    >   Solo una repetida   
    
