# http://orgmode.org/
# 

# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .*\.(org) %{
    set-option buffer filetype orgmode
}

# Highlighters
# ‾‾‾‾‾‾‾‾‾‾‾‾

add-highlighter shared/ regions -default code orgmode \
    headline1 '^\*\s'		    '$'	    ''	\
    headline2 '^\*\*\s'		    '$'	    ''	\
    headline3 '^\*\*\*\s'		'$'	    ''	\
    headline4 '^\*\*\*\*\s'	    '$'	    ''	

add-highlighter shared/orgmode/headline1 fill value
add-highlighter shared/orgmode/headline2 fill string
add-highlighter shared/orgmode/headline3 fill type

# Initialization
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook -group orgmode-highlight global WinSetOption filetype=orgmode %{ add-highlighter window ref orgmode }
hook -group orgmode-highlight global WinSetOption filetype=(?!orgmode).* %{ remove-highlighter window/orgmode }
