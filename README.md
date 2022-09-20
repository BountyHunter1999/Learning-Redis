# Learning-Redis

Learning Redis following The DevOps Guy

## Changes to the `redis.conf` file

- changed `requirepass foobared` to `requirepass SecretStrong`
- Don't make redis public 

## Persistence in Redis

- Redis will die once the container is down so mount it
- RDB Persistence higher performance mechanism because redis will take a point in time snapshot and write it to a dump file that we can configure, we can then mount that to persist the data
- AOF (Append Only File) mode will basically log every write operation that happens to redis and append it to a file. So higher durability with a performance cost

### RDB mode

- inside the config  `dbfilename dump.rdb`

### AOF

- `appendonly no` to `appendonly yes`
- and can also specify the file name to write those to
- `appendfilename "appendonly.aof"`
