#!/bin/bash

# Перевірка наявності аргументів
if [ "$#" -ne 3 ]; then
    echo "Потрібно вказати каталог, оригінальне розширення та нове розширення."
    exit 1
fi

# Зчитування аргументів
directory="$1"
original_extension="$2"
new_extension="$3"

# Перейменовані файли
renamed_files=0

# Перебір файлів у каталозі
for file in "$directory"/*."$original_extension"; do
    if [ -e "$file" ]; then
        # Витягуємо ім'я файлу без каталогу та оригінального розширення
        filename=$(basename -- "$file")
        filename_noext="${filename%.*}"

        # Складаємо нову назву файлу
        new_filename="$filename_noext.$new_extension"

        # Друк повідомлення та вивід результатів
        echo "Переіменовую $file на $directory/$new_filename"
        ((renamed_files++))
    fi
done

# Вивід загальної кількості перейменованих файлів
echo "Загальна кількість перейменованих файлів: $renamed_files"
