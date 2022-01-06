CREATE OR REPLACE VIEW prod_in_catalog AS 
SELECT prod.`name` as Product, cat.`name` as Catalog FROM products as prod
INNER JOIN catalogs as cat ON cat.id = prod.catalog_id;