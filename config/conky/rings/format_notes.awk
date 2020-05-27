BEGIN{
	OFS="";
	ORS="";
	FS=":|,";
	RS="}, {";
	print "ID ${alignc 2000}Project ${alignr 0}Description \n";
}
{if ($2 > 0) {
    if ($15~"urgency")
	    {print "${color" int($16/1.2) "} " $2 " "}
    else if ($17~"urgency")
	    {print "${color" int($18/1.2) "} " $2 " "};

	if ($9~"project")
		{print "${alignc 2000} " $10 " "}
    else if ($11~"project")
		{print "${alignc 2000} " $12 " "}
	else
        {print "${alignc 2000} " "None "};
	print "${alignr 0} ${color9} " $4 "\n"}
}
