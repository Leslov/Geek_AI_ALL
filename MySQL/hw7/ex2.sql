-- Задание описано так себе. Сделаю, как понял.
-- Выводим список продуктов, соответствующих товару (Перепишите описание задания, это жесть какая-то)
SELECT products.Name FROM tovar
INNER JOIN products ON products.TovarID = tovar.ID;

-- Выводим список разделов catalogs, соответствующих товару tovar
SELECT catalogs.Name FROM tovar
INNER JOIN catalogs ON tovar.CatalogID = catalogs.ID;