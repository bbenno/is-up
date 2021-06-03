function is-up
	function __is_up -S ; echo $url'	'(set_color green)✔(set_color normal) Up; end
	function __is_down -S; echo $url'	'(set_color yellow)⚠(set_color normal) Down; end
	function __is_invalid -S; echo $url'	'(set_color red)✖(set_color normal) Invalid; end

	for url in $argv
		if string match -irq '^[a-z0-9][a-z0-9-]{1,61}[a-z0-9]\.[a-z]{2,}$' $url
			switch (curl -s 'https://isitup.org/'$url'.json' | jq '.status_code')
				case 1; __is_up
				case 2; __is_down
				case 3; __is_invalid
			end
		else
			__is_invalid
		end
	end
end
