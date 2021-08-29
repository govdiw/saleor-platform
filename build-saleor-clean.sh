docker-compose down
docker rm -f $(docker ps -a -q)
docker volume rm $(docker volume ls -q)
docker rmi -f $(docker images -a | grep "saleor")
docker-compose -f docker-final.yml build --no-cache
docker-compose -f docker-final.yml run --rm api python3 manage.py migrate
docker-compose -f docker-final.yml run --rm api python3 manage.py collectstatic --noinput
docker-compose -f docker-final.yml run --rm api python3 manage.py populatedb
#docker-compose -f docker-final.yml up &
echo ' waiting for saleor server to start'
sleep(20)
docker-compose -f storefront.yml --no-cache