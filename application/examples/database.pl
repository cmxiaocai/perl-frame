use Data::Dumper;
use encoding "utf-8";

get_mysql_connect_appres();

$CONN_MYSQL_APPRES->do("INSERT INTO user(`uid`,`name`) VALUES(21,'xiaocai')");
$lastid = $CONN_MYSQL_APPRES->last_insert_id(undef, undef, "user", undef);
print $lastid;
