#!/bin/bash

# Colores para mejorar experiencia de usuario
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Sin color

# Directorio y configuraci�n para respaldos
BACKUP_DIR="$HOME/backups"
BACKUP_LIMIT=5 # N�mero m�ximo de backups a mantener

# Funci�n para el respaldo de directorio
backup() {
    echo -e "${GREEN}Iniciando respaldo del directorio...${NC}"
    
    # Crear el directorio de backups si no existe
    mkdir -p "$BACKUP_DIR"
    
    # Nombre de archivo de respaldo
    BACKUP_FILE="$BACKUP_DIR/backup_$(date +'%Y%m%d%H%M%S').tar.gz"
    
    # Comprimir y respaldar
    tar -czf "$BACKUP_FILE" "$HOME" || { echo -e "${RED}Error al crear el backup${NC}"; return; }
    
    echo -e "${GREEN}Respaldo creado: $BACKUP_FILE${NC}"
    
    # Gesti�n de eliminaci�n de backups antiguos
    BACKUP_COUNT=$(ls -1 "$BACKUP_DIR" | wc -l)
    if [ "$BACKUP_COUNT" -gt "$BACKUP_LIMIT" ]; then
        OLD_BACKUP=$(ls -1t "$BACKUP_DIR" | tail -1)
        rm "$BACKUP_DIR/$OLD_BACKUP"
        echo -e "${GREEN}Backup antiguo eliminado: $OLD_BACKUP${NC}"
    fi
}

# Funci�n para generar informe de uso de sistema
system_report() {
    REPORT_FILE="$HOME/system_report_$(date +'%Y%m%d%H%M%S').log"
    echo -e "${GREEN}Generando informe del sistema...${NC}"
    
    # Informes de CPU, memoria y disco
    echo "Uso de CPU:" > "$REPORT_FILE"
    top -bn1 | grep "Cpu(s)" >> "$REPORT_FILE"
    
    echo -e "\nUso de Memoria:" >> "$REPORT_FILE"
    free -h >> "$REPORT_FILE"
    
    echo -e "\nUso de Disco:" >> "$REPORT_FILE"
    df -h >> "$REPORT_FILE"
    
    echo -e "${GREEN}Informe guardado en: $REPORT_FILE${NC}"
}

# Funci�n para gesti�n de usuarios
manage_users() {
    echo -e "${GREEN}Gesti�n de usuarios...${NC}"
    read -p "Introduce el nombre del nuevo usuario: " username
    
    # Crear usuario y su directorio home
    sudo useradd -m "$username" || { echo -e "${RED}Error al crear usuario${NC}"; return; }
    
    # Cambiar permisos
    sudo chmod 755 "/home/$username"
    echo -e "${GREEN}Usuario $username creado y configurado correctamente${NC}"
}

# Men� interactivo
while true; do
    echo -e "${GREEN}\nMen� Principal:${NC}"
    echo "1) Respaldo de directorio"
    echo "2) Generar informe de uso del sistema"
    echo "3) Gesti�n de usuarios"
    echo "4) Salir"
    read -p "Selecciona una opci�n: " option

    case $option in
        1) backup ;;
        2) system_report ;;
        3) manage_users ;;
        4) echo -e "${GREEN}Saliendo...${NC}"; exit ;;
        *) echo -e "${RED}Opci�n inv�lida. Por favor selecciona una opci�n v�lida.${NC}" ;;
    esac
done
