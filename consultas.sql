-- 1 - Buscar o nome e ano dos filmes
SELECT f.Nome, f.Ano FROM Filmes f


-- 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT f.Nome, f.Ano 
FROM Filmes f
ORDER BY f.Ano

-- 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT f.Nome, f.Ano, f.Duracao 
FROM Filmes f
WHERE lower(f.Nome) like 'de volta para o futuro'

-- 4 Buscar os filmes lançados em 1997
SELECT f.* FROM Filmes f 
WHERE f.Ano = 1997 

-- 5 - Buscar os filmes lançados APÓS o ano 2000
SELECT f.* FROM Filmes f 
WHERE f.Ano > 2000 

-- 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT f.* FROM Filmes f 
WHERE f.Duracao > 100 AND f.Duracao <150 

-- 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT f.Ano, COUNT(*) AS qtd
FROM Filmes f
GROUP BY f.Ano
ORDER BY SUM(f.Duracao) Desc

-- 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT a.PrimeiroNome, a.UltimoNome
FROM Atores a
WHERE a.Genero = 'M'

-- 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT a.PrimeiroNome, a.UltimoNome
FROM Atores a
WHERE a.Genero = 'F'
ORDER BY a.PrimeiroNome

-- 10 - Buscar o nome do filme e o gênero
SELECT f.Nome, g.Genero
FROM Filmes f
INNER JOIN FilmesGenero fg ON fg.IdFilme=f.Id
INNER JOIN Generos g ON g.Id=fg.IdGenero

-- 11 - Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT f.Nome, g.Genero
FROM Filmes f
INNER JOIN FilmesGenero fg ON fg.IdFilme=f.Id
INNER JOIN Generos g ON g.Id=fg.IdGenero
WHERE g.Genero = 'Mistério'

-- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT f.Nome, a.PrimeiroNome, a.UltimoNome, ef.Papel
FROM Filmes f
INNER JOIN ElencoFilme ef ON ef.IdFilme=f.Id
INNER JOIN Atores a ON a.Id=ef.IdAtor