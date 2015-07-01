package Fcrypt;
use strict;

my $FAST_CRYPT_RAW_SECRET_MAXSIZE=600;
my $FCRYPT_D2HSTR_MAX_DATA_LEN=1024;
my $SIZE_OF_INT = 4;
my @randdata = qw/1914237089 2082659110 1153908158 1356149389 1776054697 336785726 1881968852 753547435 1673989872 1593150232 936252159 1688139577 1316830713 414151909 757250161 1777450901 1308513071 1597671358 1816946330 728171216 199865432 1065160437 618253731 568701275 1129207805 1659853419 782207937 1383484583 1832179065 613889272 598673698 1598932507 549064735 1752581856 807598248 177635784 2089367582 542083452 931183219 1615873807 2135233685 1867435379 1156529736 1304580750 134103640 1913779897 934548004 1442616711 1363967607 604010686 23304280 1563833039 1669171124 641558011 2132534314 650895281 153927782 767258604 2034379864 1986106847 1381147876 485569914 1437555706 1930212611 90668123 97670306 2107848395 32552057 639753759 891547967 1648425864 627503796 611499698 657471952 1932084546 745603338 423768201 719148902 40736401 1787735808 1323159589 64040681 1204085199 844847065 705598692 1189135866 1495742346 859526474 1956394470 1382638563 698149674 1190058698 1868208477 2135705380 972787662 1958876600 85892039 933152409 1991428658 725645798 1824700376 1492370874 1353149594 288716426 2359179 1137750492 1034319764 426127380 1856899395 1075056166 66379541 1032575336 1139096847 1270464740 1877422401 1844695540 312116958 1225681099 556738366 121027780 460836014 1254888040 1311086479 181560844 1243109773 136390493 2140437444 1329001812 1069542902 1984382454 2054647610 746759631 1329269681 1260313556 1035476057 1331628860 250580400 2069795822 1757756240 2107479795 997368340 1824135781 992571483 2136465187 947116874 722510236 1833677079 1259233832 1948191336 242931798 1380261613 261543702 1497819838 543864444 443104546 593445963 680254937 436058343 1922447775 1749797839 272957149 1829611737 349073822 1602226830 942441645 1384549880 786372042 1193022046 1306862054 396644635 1153018193 156746746 73296768 2145589677 145728285 1020413642 720616265 1979405365 132163827 521323953 74853515 1512425440 782867656 1572673353 2056289884 1225972202 18635669 589061173 1662030545 1941083444 191375364 1934987695 1623211534 540449187 1389730877 418169531 1924999067 28619272 1611191577 1084377473/;
my $strRawSecret = 
"\xA1\xB6\xC0\xC1\xA2\xBA\xAE\xC7\xEF\x0D\x0A\xCF\xE6\xBD\xAD\xB1\xB1".
"\x3D\xC8\xA5\x0D\x0A\xE9\xD9\xD7\xD3\xD6\xDE\xCD\xB7\x0D\x0A\xBF\xB4".
"\xB2\xCD\xF2\xC9\xBD\xBA\xEC\xB1\xE9\x0D\x0A\xB2\xE3\xC1\xD6\xBE\xA1".
"\xC8\xA5\x0D\x0A\xE9\xD9\xD7\xD3\xD6\xDE\xCD\xB7\x0D\x0A\xBF\xB4".
"\xCD\xF2\xC9\xBD\xBA\xEC\xB1\xE9\x0D\x0A\xB2\xE3\xC1\xD6\xBE\xA1".
"\xC8\xBE\x0D\x0A\xC2\xFE\xBD\xAD\xB1\xCC\xCD\xB8\x0D\x0A\xB0\xD9".
"\xF4\xB4\xD5\xF9\xC1\xF7\x0D\x0A\xD3\xA5\xBB\xF7\xB3\xA4\xBF\xD5".
"\x0D\x0A\xD3\xE3\xCF\xE8\xC7\xB3\xB5\xD7\x0D\x0A\xCD\xF2\xCE\xEF".
"\xCB\xAA\xCC\xEC\xBE\xBA\xD7\xD4\xD3\xC9\x0D\x0A\xE2\xEA\xC1\xC8".
"\xC0\xAA\x0D\x0A\xCE\xCA\xB2\xD4\xC3\xA3\xB4\xF3\xB5\xD8\x0D\x0A".
"\xCB\xAD\xD6\xF7\xB3\xC1\xB8\xA1\x0D\x0A\xD0\xAF\xC0\xB4\xB0\xD9".
"\xC2\xC2\xD4\xF8\xD3\xCE\x0D\x0A\xD2\xE4\xCD\xF9\xCE\xF4\xE1\xBF".
"\xE1\xC9\xCB\xEA\xD4\xC2\xB3\xED\x0D\x0A\xC7\xA1\xCD\xAC\xD1\xA7".
"\xC9\xD9\xC4\xEA\x0D\x0A\xB7\xE7\xBB\xAA\xD5\xFD\xC3\xAF\x0D\x0A".
"\xCA\xE9\xC9\xFA\xD2\xE2\xC6\xF8\x0D\x0A\xBB\xD3\xB3\xE2\xB7\xBD".
"\xE5\xD9\x0D\x0A\xD6\xB8\xB5\xE3\xBD\xAD\xC9\xBD\x0D\x0A\xBC\xA4".
"\xD1\xEF\xCE\xC4\xD7\xD6\x0D\x0A\xB7\xE0\xCD\xC1\xB5\xB1\xC4\xEA".
"\xCD\xF2\xBB\xA7\xBA\xEE\x0D\x0A\xD4\xF8\xBC\xC7\xB7\xF1\x0D\x0A".
"\xB5\xBD\xD6\xD0\xC1\xF7\xBB\xF7\xCB\xAE\x0D\x0A\xC0\xCB\xB6\xF4".
"\xB7\xC9\xD6\xDB\x0D\x0A\xBA\xE1\xBF\xD5\xB3\xF6\xCA\xC0\x0D\x0A".
"\xC3\xA7\xC0\xA5\xC2\xD8\x0D\x0A\xD4\xC4\xBE\xA1\xC8\xCB\xBC\xE4".
"\xB4\xBA\xC9\xAB\x0D\x0A\xB7\xC9\xC6\xF0\xD3\xF1\xC1\xFA\xC8\xFD".
"\xB0\xD9\xCD\xF2\x0D\x0A\xBD\xC1\xB5\xC3\xD6\xDC\xCC\xEC\xBA\xAE".
"\xB3\xB9\x0D\x0A\xCF\xC4\xC8\xD5\xCF\xFB\xC8\xDA\x0D\x0A\xBD\xAD".
"\xBA\xD3\xBA\xE1\xD2\xE7\x0D\x0A\xC8\xCB\xBB\xF2\xCE\xAA\xD3\xE3".
"\xB1\xEE\x0D\x0A\xC7\xA7\xC7\xEF\xB9\xA6\xD7\xEF\x0D\x0A\xCB\xAD".
"\xC8\xCB\xD4\xF8\xD3\xEB\xC6\xC0\xCB\xB5\x0D\x0A\xB6\xF8\xBD\xF1".
"\xCE\xD2\xCE\xBD\xC0\xA5\xC2\xD8\x0D\x0A\xB2\xBB\xD2\xAA\xD5\xE2".
"\xB8\xDF\x0D\x0A\xB2\xBB\xD2\xAA\xD5\xE2\xB6\xE0\xD1\xA9\x0D\x0A".
"\xB0\xB2\xB5\xC3\xD2\xD0\xCC\xEC\xB3\xE9\xB1\xA6\xBD\xA3\x0D\x0A".
"\xB0\xD1\xC8\xEA\xB2\xC3\xCE\xAA\xC8\xFD\xBD\xD8\x0D\x0A\xD2\xBB".
"\xBD\xD8\xD2\xC5\xC5\xB7\x0D\x0A\xD2\xBB\xBD\xD8\xD4\xF9\xC3\xC0".
"\x0D\x0A\xD2\xBB\xBD\xD8\xBB\xB9\xB6\xAB\xB9\xFA\x0D\x0A\xCC\xAB".
"\xC6\xBD\xCA\xC0\xBD\xE7\x0D\x0A\xBB\xB7\xC7\xF2\xCD\xAC\xB4\xCB".
"\xC1\xB9\xC8\xC8"; 

sub str_pad
{
	my ($str, $strlen, $padstr) = @_;
	my $padlen = $strlen - length($str);
	for(my $i=0; $i<$padlen; $i++){
		$str .= $padstr;
	}
	return $str;
}
sub strlen
{
	my ($str) = @_;
	return length($str);
}
sub hexdec{
	my ($contents) = @_;
	my $str = 0;
	for (my $i =0; $i<=length($contents)-1; $i++) {
		$str *=16;
		$str += hex($i);
	}
	return $str;
}
sub bin2hex{
	my ($contents) = @_;
	my $str = "";
	for (my $i =0; $i<=length($contents)-1; $i++) {
		$str .= unpack("H*",substr($contents, $i, 1));
	}
	return $str;
}
sub myrand
{
	my ($i) = @_;
	return $randdata[$i];
}
sub strtolower
{
	my ($str) = @_;
	return $str;
}
sub fcrypt_checksum_int
{
	my ($strKey) = @_;
	my $sum = 0;
	my $keyLen = strlen($strKey);
	my $slen = $keyLen;
	my $intStart = 0;
	if($slen%2!=0)
	{
		$strKey = str_pad($strKey,$slen+1,"\x00");
	}
	while($slen > 1)
	{
		my @arrTmp = unpack('va',substr($strKey,$intStart,2));
		$slen -= 2;
		$intStart += 2;
		$sum += $arrTmp[0];
	}
	if($slen > 0)
	{
		$strKey .='0';
		my @arrTmp = unpack('va',substr($strKey,$intStart,2));
		$sum += ($arrTmp[0]&0xff);
	}
	return $sum;

}

sub __fcrypt_init
{
	my ($strKey) = @_;
	my $strRawdest = "";
	my $intSeed = fcrypt_checksum_int($strKey);
	srand($intSeed);
	my $intRawLen = strlen($strRawSecret);
	$strRawSecret = str_pad($strRawSecret,600,"\x00");
	my $intTmp = 0;
	for(my $i=0;$i<($FAST_CRYPT_RAW_SECRET_MAXSIZE/$SIZE_OF_INT);$i++)
	{
		my $intRand = myrand($i);
		if($i*$SIZE_OF_INT >= $intRawLen)
		{
			$intTmp = $intRand;
		}else
		{
			my @arrTmp = unpack('ia',substr($strRawSecret,$i*$SIZE_OF_INT,$SIZE_OF_INT));
			$intTmp = $intRand + (0+$arrTmp[0]);
		}
		$strRawdest .=pack('i',$intTmp);
	}
	return $strRawdest;
}

sub fcrypt_hstr_2id
{
	my ($strRawdest,$strEncode) = @_;
	my $intId1 = 0;
	my $intId2 = 0;
	if(strlen($strRawdest)==0 || strlen($strEncode)==0 || strlen($strEncode)<8)
	{
		return (-1,$intId1,$intId2);
	}

	my $strdebuf = "";
	my $intslen = strlen($strEncode);
	if( $intslen > ($FCRYPT_D2HSTR_MAX_DATA_LEN+4)*2)
	{
		return (-2,$intId1,$intId2);
	}

	my $strBuffer = "";
	for(my $i=0;$i<$intslen;$i=$i+2)
	{
		my $strTmp = substr($strEncode,$i,2);
		if(strlen($strTmp) != 2)
		{
			$strTmp = "\0";
		}
		$strBuffer .= pack('C',(hexdec($strTmp))); 
	}
	my $strpbuf = "";
	my $res = fcrypt_decode_hmac($strRawdest,$strBuffer,$strpbuf);

	if($res != 2*$SIZE_OF_INT)
	{
		return (-1,$intId1,$intId2);
	}

	my @arrId = unpack('I2a',substr($strpbuf,0,8));
	$intId1 = $arrId[0];
	$intId2 = $arrId[1];
	return ($res,$intId1,$intId2);

}

sub fcrypt_decode_hmac
{
	my ($strRawdest,$strBuff,$strpbuf) = @_;
	my $intBuffLen = strlen($strBuff);
	my $intslen = $intBuffLen;
	$strpbuf = "";
	my $strpbufTail = "";
	my $magic = 0;
	if($intslen >=2)
	{
		my @rdata =  unpack('va',substr($strBuff,$intslen-2,2));
		my $intTmp = $intslen&0xff;
		my @arrTmp = unpack('va',substr($strRawdest,2*$intTmp,2));
		my $wdata = $rdata[1]^$arrTmp[1];
		$strpbufTail = pack('v',$wdata);
		$magic = $intslen + $wdata;
		$intslen -= 2;
	}

	my $intTmp = 0;
	while($intslen > 1)
	{
		my @rdata = unpack('va',substr($strBuff,$intTmp,2));
		$intTmp += 2;
		my @arrTmp = unpack('va',substr($strRawdest,2*(($magic++)&0xff),2));
		$strpbuf .= pack('v',$rdata[1]^$arrTmp[1]);
		$intslen -= 2;
	}
	if($intslen > 0)
	{
		my @rdata = unpack('Ca',substr($strBuff,$intTmp,1));
		my @arrTmp = unpack('va',substr($strRawdest,2*($magic&0xff),2));
		my $intTmp1 = $arrTmp[1]&0xff;
		$strpbuf .= pack('C',($rdata[1]^$intTmp1)&0xff);
	}
	$strpbuf .=$strpbufTail;
	my $intBuflen = strlen($strpbuf);
	my @arrOldsum = unpack('Ia',substr($strpbuf,$intBuflen-4,4));
	my $intSum = fcrypt_checksum_int(substr($strpbuf,0,$intBuflen-4));

	$intSum = ($intSum >>16) | (($intSum<<16)&0xffff0000);
	if($intSum != $arrOldsum[1])
	{
		return -2;
	}
	return $intBuffLen-4;
}

sub fcrypt_id_2hstr
{
	my ($strRawdest,$intId1,$intId2) = @_;
	my $strtmp = pack('i',$intId1).pack('i',$intId2);
	my $strResult = fcrypt_encode_hmac($strRawdest,$strtmp);
	return $strResult;
}

sub fcrypt_encode_hmac
{
	my ($strRawdest,$strPdata) = @_;
	my $strBuff = $strPdata;
	my $intSum = fcrypt_checksum_int($strPdata);
	$intSum = ($intSum>>16)|(($intSum<<16)&0xffff0000);
	$strBuff .= pack('I',$intSum);

	my $intLenNum = strlen($strBuff);
	my $strResult = "";
	my $strResultLast = "";
	my $intMagic = "";
	if($intLenNum >=2)
	{
		my @arrUnpack = unpack('va',substr($strBuff,$intLenNum-2,2));
		$intMagic = $intLenNum+$arrUnpack[0];
		my $intKeyIndex = $intLenNum &0xff;
		my @arrUnpack1 = unpack('va',substr($strRawdest,$intKeyIndex*2,2));
		$strResultLast = pack('v',$arrUnpack[0]^$arrUnpack1[0]);
		$intLenNum -= 2;
	}
	my $intCount = 0;
	while($intLenNum >1)
	{
		my $intKeyIndex =$intMagic & 0xff;
		my @arrUnpack = unpack('va',substr($strBuff,$intCount,2));
		my @arrUnpack1 = unpack('va',substr($strRawdest,$intKeyIndex*2,2));
		$strResult .= pack('v',($arrUnpack[0]^$arrUnpack1[0]));

		$intLenNum -= 2;
		$intCount += 2;
		$intMagic++;

	}
	if($intLenNum > 0 )
	{
		my $intKeyIndex =$intMagic & 0xff;
		my @arrUnpack = unpack('Ca',substr($strBuff,$intCount,1));
		my @arrUnpack1 = unpack('va',substr($strRawdest,$intKeyIndex*2,2));
		$strResult .= pack('C',($arrUnpack[0]^$arrUnpack[0])&0xff);
	}
	$strResult = strtolower(bin2hex($strResult.$strResultLast));
	return $strResult;
}


1;
