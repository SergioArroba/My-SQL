-- 1./
SELECT countries.name, languages.language, languages.percentage
FROM countries
LEFT JOIN languages
ON countries.id = languages.country_id
WHERE language = 'Slovene'
ORDER BY percentage DESC 

-- 2./
SELECT countries.name, COUNT(cities.name) AS cities 
FROM countries
JOIN cities WHERE countries.id = cities.country_id
GROUP BY countries.name	
ORDER BY cities DESC

-- 3./
SELECT name, population, country_id FROM cities
WHERE country_id = 136 AND population > 500.000 
ORDER BY population DESC

-- 4./
SELECT countries.name, languages.language , languages.percentage FROM languages
JOIN countries 
WHERE languages.country_id = countries.id AND languages.percentage  > 89 
ORDER BY percentage DESC

-- 5./
SELECT  name, surface_area, population  FROM countries	
WHERE surface_area < 501 AND population > 100000

-- 6./
SELECT name, government_form, capital, life_expectancy FROM countries
WHERE government_form = 'Constitutional Monarchy' AND capital > 200 AND life_expectancy > 75

-- 7./
SELECT countries.name AS country, cities.name AS city_name, cities.district, cities.population FROM cities
JOIN countries
ON countries.id = cities.country_id
WHERE  countries.name = 'Argentina' AND cities.population > 500000

-- 8./
SELECT region, COUNT(name) AS paises  FROM countries
GROUP BY region
ORDER BY paises DESC



	


