docker-compose -f docker-final.yml build --no-cache
docker-compose run --rm api python3 manage.py migrate
docker-compose run --rm api python3 manage.py collectstatic --noinput
docker-compose run --rm api python3 manage.py populatedb
docker-compose -f docker-final.yml up && docker-compose -f storefront.yml --no-cache