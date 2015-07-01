
$CONN_MYSQL_APPRES=False;

sub get_mysql_connect_appres{
        if($CONN_MYSQL_APPRES!=False){
                return;
        }
	my $config_ref = Config::INI::Reader->read_file('config/mysql_app.ini');
	my $host = $config_ref->{'product'}->{'DBI_HOST'};
	my $port = $config_ref->{'product'}->{'DBI_PORT'};
	my $db   = $config_ref->{'product'}->{'DBI_DB'};
        my $mysql_dsn  = "DBI:mysql:database=$db;host=$host;port=$port";
        my $mysql_user = $config_ref->{'product'}->{'DBI_USER'};
        my $mysql_pass = $config_ref->{'product'}->{'DBI_PASS'};
        $CONN_MYSQL_APPRES = DBI->connect($mysql_dsn,$mysql_user,$mysql_pass);
}


