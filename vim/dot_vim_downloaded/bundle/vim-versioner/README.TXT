
" VIM plugin for 'Versioner', (https://github.com/monotone-the-musical/versioner)
"
" Note :  VIM plugin version of Versioner works on the current
"         file only, hence there is no need to specify a filename.
"         This means the syntax is somewhat simplified.
"
" Basically :
"
"     :Vs -l
"       - to list any backups of current file
"
"     :Vs -b [OPTIONAL_COMMENT]
"       - to backup current file with an optional comment
"       - note: comment does not require -c parameter as used in
"         the stand-alone Versioner utility.
"
"     :Vs -d
"       - to delete any previously created backups.
"
" Requirements and restrictions :
"
"     - Versioner needs to be installed
"       + see: https://github.com/monotone-the-musical/versioner
"
"     - Only the saved file is backed up... not the buffer. This
"       is by design, so that you can backup your file before you
"       save any changes you've already made.
"
"     - You cannot restore files via the plugin. You still need
"       to use the stand-alone Versioner utility for that (run
"       'vs -h' from the CLI for syntax).
"

" VIM plugin for 'Versioner', (https://github.com/monotone-the-musical/versioner)
"
" Note :  VIM plugin version of Versioner works on the current
"         file only, hence there is no need to specify a filename.
"         This means the syntax is somewhat simplified.
"
" Basically :
"
"     :Vs -l
"       - to list any backups of current file
"
"     :Vs -b [OPTIONAL_COMMENT]
"       - to backup current file with an optional comment.
"       - note: comment does not require -c parameter as used in 
"         the stand-alone Versioner utility.
"
"     :Vs -d
"       - to delete any previously created backups of current file.
"
"     :Vs -r
"       - to restore a previously backed up version of current file.
"
" Requirements and restrictions :
"
"     - Versioner needs to be installed
"       + see: https://github.com/monotone-the-musical/versioner
"
"     - Only the saved file is backed up... not the buffer. This
"       is by design, so that you can backup your file before you
"       save any changes you've already made.
"
"     - When restoring, any un-saved changes in the buffer will be 
"       lost! If changes in the buffer have been saved to disk, but 
"       the saved file has not been backed up by Versioner, then 
"       Versioner will automatically backup the new file with the
"       comment 'autosaved' before presenting a restore menu.
"
