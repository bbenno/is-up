function is-up
	for url in $argv
		if string match -irq '^[a-z0-9][a-z0-9-]{1,61}[a-z0-9]\.[a-z]{2,}$' "$url"
			switch (curl -s 'https://isitup.org/'$url'.json' | jq '.status_code')
				case 1; echo "$url	"(set_color green)'✔'(set_color normal)' Up'
				case 2; echo "$url	"(set_color yellow)'⚠'(set_color normal)' Down'
				case 3; echo "$url	"(set_color red)'✖'(set_color normal)' Invalid'
			end
		else
			echo "$url	"(set_color red)'✖'(set_color normal)' Invalid'
		end
	end
end
