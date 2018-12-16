# start Elastic Search and kibana
elasticsearch -d
sudo -i service kibana start

# Start zookeeper and kafka
zookeeper-server-start.sh $PROJECT_HOME/kafka/config/zookeeper.properties &
kafka-server-start.sh $PROJECT_HOME/kafka/config/server.properties &

# Start MongoDB
mongod --dbpath $PROJECT_HOME/mongodb/data/db &


# Start airflow
# initialize the database
airflow initdb

# start the web server, default port is 8080
airflow webserver -p 8080

# start the scheduler
airflow scheduler
# visit localhost:8080 in the browser and enable the example dag in the home page