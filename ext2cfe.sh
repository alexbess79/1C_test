# #!/bin/bash
# set -x
# while getopts ":s:o:n:v:" opt; do
#   case $opt in
#     s) SRC_DIR="$OPTARG" ;;
#     o) OUT_CFE="$OPTARG" ;;
#     n) EXT_NAME="$OPTARG" ;;
#     v) VERSION="$OPTARG" ;;
#     \?) echo "Неверный аргумент: -$OPTARG" >&2; exit 1 ;;
#   esac
# done
#!/bin/bash

# Параметры
SRC_DIR="./src"
OUT_CFE="./bin/out.cfe"
EXT_NAME="FileConverter"
VERSION="1.0.0"

# Проверки
if [ ! -d "$SRC_DIR" ]; then
  echo "ОШИБКА: Папка $SRC_DIR не найдена!"
  exit 1
fi

mkdir -p ./bin  # Создаем папку, если её нет

# Временная папка
TMP_DIR=$(mktemp -d)
cp -r "$SRC_DIR"/* "$TMP_DIR/"

# Сборка
echo "=== ЗАПУСК СБОРКИ ==="
oscript -e "
Использовать v8runner;
Сообщить('Версия v8runner: ' + v8runner.Версия());
Упаковщик = Новый УпаковщикCFE();
Сообщить('Упаковка в: ' + \"$OUT_CFE\");
Упаковщик.Упаковать(
    \"$TMP_DIR\",
    \"$OUT_CFE\",
    \"$EXT_NAME\",
    \"$VERSION\"
);
Сообщить('УСПЕХ!');
" || { echo "ОШИБКА В СКРИПТЕ 1С"; exit 1; }

# Проверка
if [ -f "$OUT_CFE" ]; then
  echo "Файл $OUT_CFE успешно создан!"
  ls -la "$OUT_CFE"
else
  echo "ОШИБКА: Файл $OUT_CFE не создан!"
  exit 1
fi

# Очистка
rm -rf "$TMP_DIR"