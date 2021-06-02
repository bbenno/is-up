function is-up
	set up_status '✔ Up' '⚠ Down' '✖ Invalid'
	for url in $argv
		set status_code 3
		if string match -irq '^[a-z0-9][a-z0-9-]{1,61}[a-z0-9]\.[a-z]{2,}$' $url
			set status_code (curl -s 'https://isitup.org/'$url'.json' | jq '.status_code')
		end
		echo $url'	'$up_status[$status_code]
	end
end
