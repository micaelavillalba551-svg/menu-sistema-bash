#!/bin/bash

# Colores
ROJO='\033[0;31m'
VERDE='\033[0;32m'
AMARILLO='\033[1;33m'
SIN='\033[0m'

# Variables que se pueden cambiar
LOG=~/sistemas.log
UMBRAL=80
TAMANO=50

op=0

while [ "$op" != "5" ]
do
    echo ""
    echo -e "${AMARILLO}=== MENU ===${SIN}"
    echo "1. Informe del uso cpu memoria y disco"
    echo "2. Controlar espacio en disco"
    echo "3. Limpiar temporales y cache p/ liberar espacio"
    echo "4. Detectar archivos grandes"
    echo "5. Salir"
    echo "Elegi una opcion:"
    read op

    # Tarea 1: informe
    if [ "$op" = "1" ]
    then
        echo "Informe del dia:" >> $LOG
        date >> $LOG
        uptime >> $LOG
        free -h >> $LOG
        df -h / >> $LOG
        echo -e "${VERDE}Informe guardado en el log${SIN}"
    fi

    # Tarea 2: control de disco
    if [ "$op" = "2" ]
    then
        uso=$(df --output=pcent / | tail -1 | tr -d ' %')
        echo "El disco esta usado al $uso por ciento"
        if [ "$uso" -gt "$UMBRAL" ]
        then
            echo -e "${ROJO}ALERTA: disco casi lleno${SIN}"
            echo "ALERTA: disco al $uso por ciento" >> $LOG
        else
            echo -e "${VERDE}El disco esta optimo ${SIN}"
        fi
    fi

    # Tarea 3: limpieza
    if [ "$op" = "3" ]
    then
        rm -f /tmp/*.tmp
        rm -rf ~/.cache/mozilla
        rm -rf ~/.cache/chromium
        rm -rf ~/.cache/google-chrome
        echo "Se realizo  una limpieza" >> $LOG
        echo -e "${VERDE}Limpieza lista${SIN}"
    fi

    # Tarea 4: archivos grandes
    if [ "$op" = "4" ]
    then
        echo "En que carpeta queres buscar ?  ejemplo (/home/mica/)"
        read carpeta
        if [ -d "$carpeta" ]
        then
            echo "Archivos de mas de $TAMANO MB en $carpeta:" >> $LOG
            find $carpeta -type f -size +${TAMANO}M -exec ls -lhS {} + 2> /dev/null >> $LOG
            echo -e "${VERDE}Busqueda lista, mira el log${SIN}"
        else
            echo -e "${ROJO}Esa carpeta no existe${SIN}"
        fi
    fi

    if [ "$op" = "5" ]
    then
        echo "programa finalizado"
    fi

    # Validacion
    if [ "$op" != "1" ] && [ "$op" != "2" ] && [ "$op" != "3" ] && [ "$op" != "4" ] && [ "$op" != "5" ]
    then
        echo -e "${ROJO}Opcion no valida${SIN}"
    fi
done
