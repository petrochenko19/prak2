#!/bin/bash

# Функція для створення 25 файлів
create_files() {
    local base_name="$1"
    local start_number="$2"

    for ((i = 0; i < 25; i++)); do
        touch "${base_name}$((start_number + i))"
    done
}

# Отримання максимального числа файлів у поточному каталозі
max_number=$(ls | grep -E "^${USER}[0-9]+$" | sed -E "s/${USER}([0-9]+)/\1/" | sort -nr | head -n 1)

# Перевірка на наявність числа, інакше встановлення значення за замовчуванням
if [ -z "$max_number" ]; then
    max_number=0
fi

# Виклик функції для створення 25 файлів
create_files "$USER" "$((max_number + 1))"

# Вивід повідомлення
echo "Створено 25 файлів: ${USER}$((max_number + 1)) - ${USER}$((max_number + 25))"
