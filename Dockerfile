# Используем официальный образ Go в качестве базового
FROM golang:1.22.0

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем файлы go.mod и go.sum для установки зависимостей
COPY go.mod go.sum ./

# Устанавливаем зависимости
RUN go mod download

# Копируем остальные файлы проекта
COPY . .

# Собираем приложение
RUN go build -o main .

# Устанавливаем команду для запуска приложения
CMD ["./main"]
