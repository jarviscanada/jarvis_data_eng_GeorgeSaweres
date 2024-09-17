-- Note: Unlike bash script comments using `#`, SQL uses `--`

-- connect to the psql instance
--psql -h localhost -U postgres -W

-- list all database
--postgres=# \l

-- create a database
--postgres=# CREATE DATABASE host_agent;

-- connect to the new database;
\c host_agent;

-- table columns
--id,hostname,cpu_number,cpu_architecture,cpu_model,cpu_mhz,L2_cache,total_mem,timestamp


-- Create a host_info table
CREATE TABLE IF NOT EXISTS PUBLIC.host_info
  ( 
     id               SERIAL NOT NULL, 
     hostname         VARCHAR NOT NULL, 
     cpu_number       INT2 NOT NULL, 
     cpu_architecture VARCHAR NOT NULL, 
     cpu_model        VARCHAR NOT NULL, 
     cpu_mhz          FLOAT8 NOT NULL, 
     l2_cache         INT4 NOT NULL, 
     "timestamp"      TIMESTAMP NULL, 
     total_mem        INT4 NULL, 
     CONSTRAINT host_info_pk PRIMARY KEY (id), 
     CONSTRAINT host_info_un UNIQUE (hostname) 
  );


--columns
--timestamp,host_id,memory_free,cpu_idle,cpu_kernel,disk_io,disk_available


-- Create a host_usage table
CREATE TABLE IF NOT EXISTS PUBLIC.host_usage 
  ( 
     "timestamp"    TIMESTAMP NOT NULL, 
     host_id        SERIAL NOT NULL, 
     memory_free    INT4 NOT NULL, 
     cpu_idle       INT2 NOT NULL, 
     cpu_kernel     INT2 NOT NULL, 
     disk_io        INT4 NOT NULL, 
     disk_available INT4 NOT NULL, 
     CONSTRAINT host_usage_host_info_fk FOREIGN KEY (host_id) REFERENCES 
     host_info(id) 
  );
