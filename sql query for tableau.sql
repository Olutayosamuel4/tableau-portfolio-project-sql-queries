Queries used for Tableau project

 --1

select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as death_percentage
from portfolioproject..CovidDeaths 
--where location like '%kingdom%'
where continent is not null
--group by date
order by 1,2


---2 continent with the highest death count per continent

select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
from portfolioproject..CovidDeaths 
where continent is not null
group by continent  
order by TotalDeathCount desc

--3

select location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as percentpopulationinfected
from portfolioproject..CovidDeaths 
--where location like '%kingdom%'
group by location, population 
order by percentpopulationinfected desc

--4 

select location, population, date, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as percentpopulationinfected
from portfolioproject..CovidDeaths 
--where location like '%kingdom%'
group by location, population, date  
order by percentpopulationinfected desc
