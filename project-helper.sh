#!/bin/bash

PROJECT_NAME="$1"
REPORT_DIR="reports"
OUTPUT_FILE="$REPORT_DIR/report.txt"
README_FILE="README.md"

create_structure() {
  mkdir -p "$REPORT_DIR"
  echo "Папка '$REPORT_DIR' создана."
  touch "$OUTPUT_FILE"
  touch "$README_FILE"
}

check_project_name() {
  if [ -z "$PROJECT_NAME" ]; then
    read -p "Введите название проекта: " PROJECT_NAME
  fi

  if [ -z "$PROJECT_NAME" ]; then
    echo "Имя проекта не указано"
    exit 1
  fi
}

check_result() {
  if [[ -f "$OUTPUT_FILE" ]] && [[ -f "$README_FILE" ]]; then
    echo "Все нужные файлы найдены!"
  else
    echo "Ошибка! Отсутствует необходимый файл!"
    exit 1
  fi
}

generate_report() {
  echo "Проект: $PROJECT_NAME" > "$OUTPUT_FILE"
  echo "Дата: $(date)" >> "$OUTPUT_FILE"
  echo "Количество файлов в текущей директории: $(find . -type f | wc -l)" >> "$OUTPUT_FILE"
  find . -type f >> "$OUTPUT_FILE"
}

fill_readme() {
  echo "# Практическая работа «Основы Bash-скриптов»" > "$README_FILE"
  echo "## В работе использованы следующие инструменты:" >> "$README_FILE"

  for step in "Переменные" "Чтение ввода" "Условные конструкции с if" "Цикл for" "Функции"; do
    echo "- $step" >> "$README_FILE"
  done
}

print_report() {
  head "$OUTPUT_FILE"
}

create_structure
check_project_name

for step in "создание отчёта" "проверка файлов" "заполнение readme"; do
  echo "Шаг: $step"
done

generate_report
fill_readme
check_result
print_report

