
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

if !has('python')
    echo "Error: Required vim compiled with +python"
    finish
endif

function! Versioner(...)

"----------- START PYTHON -----------------------
python << EOF

import versioner
import vim

# parameters
vimarg1 = vim.eval("a:1")
try:
  remaining = vim.eval("a:000")
  del remaining[0]
except:
  remaining = [""]

comment=""
for aword in remaining:
  comment = comment+" "+aword

currentfile = vim.current.buffer.name
currentbuffer = vim.current.buffer

if vimarg1 == "-l":
  thefile = versioner.loadfile(currentfile)
  thefile.list_backups_by_name()

if vimarg1 == "-b":
  thefile = versioner.loadfile(currentfile,"",comment.lstrip())
  wrote = thefile.backup()
  newhash=wrote[0]
  updatedhash=wrote[1]
  thefilename=thefile.meta[1].keys()[0]
  if not newhash and not updatedhash:
    print ("\n%s already backed up.\n" % (thefilename))
  elif not newhash and updatedhash:
    print ("\n%s contents already backed up but new filename noted.\n" % (thefilename))
  else:
    print ("\n%s backed up.\n" % (thefilename))

if vimarg1 == "-d":
  thefile = versioner.loadfile(currentfile)
  try:
    thefile.restore_backup_by_name(True)
  except:
    print "aborted"
  vim.command("redraw!") # redraw as screen gets garbled
  
if vimarg1 == "-r":
  thefile = versioner.loadfile(currentfile,"","autosaved")
  wrote = thefile.backup()
  try:
    thefile.restore_backup_by_name()
    vim.command("edit!") # refresh from disk
  except:
    print "aborted"
  vim.command("redraw!") # redraw as screen gets garbled
 
EOF
"----------- END PYTHON -----------------------

endfunction

command! -nargs=+ Vs call Versioner(<f-args>)

