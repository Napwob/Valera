# valera margenal


## Install

```bash
gem install bundler
bundle install
```

## Run test

```bash
rspec
```

## Run rubocop

```bash
rubocop
rubocop -a # Auto-correct offenses
```

Параметры Валеры

- Здоровью (0 - 100)
- Мана (Алкоголь в крови) (0-100)
- Жизнерадостность (-10, 10)
- Усталость (0, 100)
- деньги

Возможные действия:

Пойти на работу (Можно только если алкоголь < 50 а усталость < 10):

- -5 Жизнерадостность
- -30 мана
+ +$100
+ +70 усталость

Созерцать природу:

+ +1 Жизнерадостность
- -10 Алкоголь
+ +10 усталость

Пить вино и смотреть сериал:

- -1 Жизнерадостность
+ +30 Алкоголь
+ +10 Усталость
- -5 Здоровью
- -$20

Сходить в баре:

+ +1 Жизнерадостность
+ +60 Алкоголь
+ +40 Усталость
- -10 Здоровью
- -$100

Выпить с маргинальными личностями:

+ +5 Жизнерадостность
- -80 здоровье
+ +90 Алкоголь
+ +80 усталость
- -$150

Петь в метро:

+ +1 Жизнерадостность
+ +10 Алкоголь
+ +$10 (еще + $50 если изначально алкоголь был > 40 & < 70)
+ +20 усталость

Спать:

+ +90 здоровье если алкоголь < 30
- -3 Жизнерадостность если алкоголь > 70
- -50 алкоголь
- -70 усталость

Фичи:
1. Игра в бесконечном цикле
2. Сохранение\загрузка из файла
3. Конфигурирование. Все возможные события должны быть описаны в файле, который загружается при инициализации игры.
