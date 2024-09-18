/*Часть 1: Функция форматирования секунд в дни, часы, минуты и секунды
Шаги:
В SQL функция будет работать с операцией деления (DIV) для вычисления целого числа дней, часов, минут и секунд.
Используем модульное деление (MOD) для остатка при преобразовании секунд.
Используем команду CONCAT для форматирования результата*/




CREATE FUNCTION format_seconds(seconds INT) 
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE secs INT;
    DECLARE result VARCHAR(255);

    -- Считаем количество дней
    SET days = seconds DIV 86400;
    SET seconds = seconds MOD 86400;

    -- Считаем количество часов
    SET hours = seconds DIV 3600;
    SET seconds = seconds MOD 3600;

    -- Считаем количество минут
    SET minutes = seconds DIV 60;

    -- Остаток - это секунды
    SET secs = seconds MOD 60;

    -- Форматируем результат в виде строки
    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', secs, ' seconds');

    RETURN result;
END$$

/*Пример использования:
SELECT format_seconds(123456);
Результат:
'1 days 10 hours 17 minutes 36 seconds'*/

/*Часть 2: Вывод только чётных чисел от 1 до 10
Для вывода четных чисел от 1 до 10 можно использовать простой 
запрос с условием (WHERE) для выбора чисел, которые делятся на 2 без остатка.*/


SELECT number
FROM (
    SELECT 1 AS number
    UNION ALL SELECT 2
    UNION ALL SELECT 3
    UNION ALL SELECT 4
    UNION ALL SELECT 5
    UNION ALL SELECT 6
    UNION ALL SELECT 7
    UNION ALL SELECT 8
    UNION ALL SELECT 9
    UNION ALL SELECT 10
) AS numbers
WHERE number % 2 = 0;

/*Описание:

В подзапросе создается временная таблица с числами от 1 до 10.
Условие WHERE number % 2 = 0 фильтрует только четные числа 
(то есть числа, которые делятся на 2 без остатка).*/



