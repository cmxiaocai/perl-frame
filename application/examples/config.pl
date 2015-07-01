
use Config::INI::Reader;
use Data::Dumper;
use encoding "utf-8";

require('application/bootstrap.pl');

$config_ref = Config::INI::Reader->read_file('config/api_user.ini');
print Dumper($config_ref);
print Dumper($config_ref->{$ENVIRONMENT});
print Dumper($config_ref->{$ENVIRONMENT}->{'API_HOST'});


