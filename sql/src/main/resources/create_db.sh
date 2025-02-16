cd /Users/dmitriykhromov/Projects/skillbox
git pull
export PGPASSWORD='password'
psql -h localhost users -p 5001 -U user -a -f sql/src/main/resources/script.sql