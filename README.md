# digdag_embulk_pg

We are going to use Embulk and Digdag to load CSV to PostgreSQL, prepare the data and run few SQL queries. Installing Postgres and pdAdmin 4 can help you reduce more steps instead of installing and creating the database using linux commands. If you are an expert of vim editors then please use linux commands for creating DBs.

Prerequisite for the assignment on Windows 10
1. You have installed `Java` version 8
2. Install postgresql and configure
3. Install pgAdmin 4 (create the database with user as "postgres" and password as "admin")
4. Create database "td_coding_challenge"
5. Install Ubuntu app (https://www.itechguides.com/how-to-install-ubuntu-on-windows-10/)

### Run below command for sudo privilege

```
$ sudo -s

```

### Install Embulk (run the following command in git bash)

```
$ curl --create-dirs -o ~/.embulk/bin/embulk -L "https://dl.embulk.org/embulk-latest.jar"
$ chmod +x ~/.embulk/bin/embulk
$ echo 'export PATH="$HOME/.embulk/bin:$PATH"' >> ~/.bashrc
$ source ~/.bashrc
```

### Install JDBC input plugins for Embulk-postgresql
```
$ embulk gem install embulk-input-postgresql
```
### Install JDBC output plugins for Embulk-postgresql
```
$ embulk gem install embulk-output-postgresql
```

### Install Digdag (use the following command)
```
$ curl -o ~/bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-latest"
$ chmod +x ~/bin/digdag
$ echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
```

### Embulk and Digdag command can be tested using their respective examples 

     Embulk: https://github.com/embulk/embulk#linux--mac--bsd
		 
     Digdag: http://docs.digdag.io/getting_started.html#downloading-the-latest-version

### Digdag workflow execute.
```bash

$ cd ~/ # change to the directory where you want to save the project
$ git clone { COPY PASTE MY GIT REPO }
$ cd digdag-embulk-postgres/embulk_to_pg
$ digdag secrets --local --set pg.password=admin
$ digdag run digdag_embulk_pg.dig -O log/task

```
