package Loglib;
use strict;
use Digest::MD5  qw/ md5_hex /;
use POSIX qw(strftime);
use Time::Local;
my $LOG_LEVEL = 16;
my $SN = "Loglib";
sub NOTICE_LOG          
{                       
        my ($cont,$log) = @_;
        PrintLog("NOTICE",$cont,$log);
}                       
sub ERROR_LOG           
{                               
        my ($cont,$log) = @_;        
        PrintLog("ERROR",$cont,$log);
}                       
                
sub DEBUG_LOG  
{        
        my ($cont,$log) = @_;
        PrintLog("DEBUG",$cont,$log);
}               
sub FATAL_LOG   
{       
        my ($cont,$log) = @_;
        PrintLog("FATAL",$cont,$log);
}
sub WARN_LOG
{
        my ($cont,$log) = @_;
        PrintLog("WARN",$cont,$log);
}
sub PrintLog    
{
        my ($flag,$cont,$log) = @_;
	if($LOG_LEVEL<16)
	{
		return if($flag eq "DEBUG");
	}
        my $dt = GetLogDate();
	if(defined ($log)){
		print $log "$dt $flag $cont\n";
	}
	else{
        	print "$dt $flag $cont\n";
	}
}
sub GetLogDate
{
        my $dt = strftime "%Y-%m-%d %H:%M:%S", localtime(time);
        return $dt;
}       
