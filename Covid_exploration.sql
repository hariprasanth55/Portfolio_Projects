-- Select what data we are going to use it.

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM CovidDeaths
ORDER BY 1, 2;


-- Looking at Total Cases Vs Total Deaths
-- Shows the likelihood of dying if you contract covid in your country.

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases) * 100 AS DeathPercentage
FROM CovidDeaths
WHERE location LIKE '%ndia'
ORDER BY 1, 2;


-- Looking at Total Cases Vs Population
-- Shows what percentage of Population Got Covid.

SELECT location, date, population, total_cases, (total_cases/population) * 100 AS TotalCovid
FROM CovidDeaths
WHERE location LIKE '%ndia'
ORDER BY 1, 2;



-- Looking at countries with highest infection rate compared to population

SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population)) * 100 AS PercentPopulationInfected
FROM CovidDeaths
-- WHERE location LIKE '%ndia'
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC;


-- Showing Countries with highest Deat Count Per Population

SELECT location, MAX(CAST(total_deaths AS int)) AS TotalDeathCount
FROM CovidDeaths
-- WHERE location LIKE '%ndia'
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeathCount DESC;


-- LET's BREAK THINGS DOWN BY CONTINENT

SELECT location, MAX(CAST(total_deaths AS int)) AS TotalDeathCount
FROM CovidDeaths
-- WHERE location LIKE '%ndia'
WHERE continent IS NULL
GROUP BY location
ORDER BY TotalDeathCount DESC


-- Showing the continents with highest death count

SELECT continent, MAX(CAST(total_deaths AS int)) AS TotalDeathCount
FROM CovidDeaths
-- WHERE location LIKE '%ndia'
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC
