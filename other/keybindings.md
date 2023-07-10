List of all costum keybindings.
The <kbd>Leader</kbd> key for me is the <kbd>Space</kbd> key 

## Normal mode
### Text editing commands
* <kbd>Alt</kbd> + <kbd>k</kbd>: Move current line up
* <kbd>Alt</kbd> + <kbd>j</kbd>: Move current line down
* <kbd>g</kbd> + <kbd>c</kbd> + <kbd>c</kbd>: Comment current line using linewise comment ([numToStr/Comment.nvim][comments_plugin] plugin)
* <kbd>g</kbd> + <kbd>b</kbd> + <kbd>c</kbd>: Comment current line using blockwise comment ([numToStr/Comment.nvim][comments_plugin] plugin)
### Movement commands
* <kbd>g</kbd> + <kbd>g</kbd>: Go to the bottom of the file
* <kbd>G</kbd> (<kbd>⇧ Shift</kbd> + <kbd>g</kbd>): Go to the end of the file
* <kbd>^</kbd>: Go to the start of the line (work also in visual mode)
* <kbd>$</kbd> (or <kbd>g</kbd> + <kbd>\_</kbd>): Go to the end of the line (work also in visual mode)
* <kbd>I</kbd> (<kbd>⇧ Shift</kbd> + <kbd>i</kbd>): Go to the start of the line insert mode
* <kbd>A</kbd> (<kbd>⇧ Shift</kbd> + <kbd>a</kbd>): Go to the end of the line in insert mode
* <kbd>⇧ Shift</kbd> + <kbd>h</kbd>: Move to previous tab
* <kbd>⇧ Shift</kbd> + <kbd>l</kbd>: Move to next tab
* <kbd>ctrl</kbd> + <kbd>h</kbd>: Move to the left windows
* <kbd>ctrl</kbd> + <kbd>l</kbd>: Move to the right windows
* <kbd>%</kbd>: Move to the opening/closing bracket
* <kbd>b</kbd>: Previous word
* <kbd>w</kbd>: Next word (start of the next word)
* <kbd>e</kbd>: Next word (end of the next word)
* <kbd>ctrl</kbd> + <kbd>b</kbd>: Close the current buffer
* <kbd>g</kbd> + <kbd>d</kbd>: Go to definition of the highlighted text under the cursor (require LSP)
* <kbd>g</kbd> + <kbd>D</kbd>: Go to declaration of the highlighted text under the cursor (require LSP)
* <kbd>]</kbd> + <kbd>d</kbd>: Go to next LSP error/warning/note in the file (require LSP)
* <kbd>[</kbd> + <kbd>d</kbd>: Go to previous LSP error/warning/note in the file (require LSP)
### Yank (copy command)
* <kbd>y</kbd> + <kbd>a</kbd> + <kbd>w</kbd>: copy the word currently selected
* <kbd>y</kbd> + <kbd>a</kbd> + <kbd>s</kbd>: copy current sentence
* <kbd>y</kbd> + <kbd>a</kbd> + <kbd>b</kbd>: copy block (including block delimiters)
* <kbd>y</kbd> + <kbd>i</kbd> + <kbd>b</kbd>: copy INSIDE block (excluded block delimiters)  
* <kbd>y</kbd> + <kbd>a</kbd> + <kbd>(</kbd> (or <kbd>y</kbd> + <kbd>a</kbd> + <kbd>)</kbd>): copy text inside curved brackets, WITH bracktes
* <kbd>y</kbd> + <kbd>i</kbd> + <kbd>(</kbd> (or <kbd>y</kbd> + <kbd>a</kbd> + <kbd>)</kbd>): copy text inside curved brackets, WITHOUT bracktes
* <kbd>y</kbd> + <kbd>a</kbd> + <kbd>"</kbd>: same as <kbd>y</kbd> + <kbd>a</kbd> + <kbd>(</kbd> but with double quotes
* <kbd>y</kbd> + <kbd>i</kbd> + <kbd>"</kbd>: same as <kbd>y</kbd> + <kbd>i</kbd> + <kbd>(</kbd> but with double quotes
### Change mode
* <kbd>i</kbd>: Enter in insert mode before the cursor
* <kbd>a</kbd>: Enter in insert mode after the cursor
* <kbd>v</kbd>: Enter visual character mode
* <kbd>V</kbd> (<kbd>⇧ Shift</kbd> + <kbd>v</kbd>): Enter visual line mode
* <kbd>ctrl</kbd> + <kbd>q</kbd>: Enter visual block mode
### Surround commands
* <kbd>(</kbd> + <kbd>(</kbd>: Surround word under the cursor with round brackets
* <kbd>)</kbd> + <kbd>)</kbd>: Remove round brackets around a word (not work perfectly)
* <kbd>[</kbd> + <kbd>[</kbd>: Surround word under the cursor with square brackets (NOT WORK)
* <kbd>]</kbd> + <kbd>]</kbd>: Remove square brackets around a word (not work perfectly) (NOT WORK)
* <kbd>{</kbd> + <kbd>{</kbd>: Surround word under the cursor with square brackets
* <kbd>}</kbd> + <kbd>}</kbd>: Remove square brackets around a word (not work perfectly)
* <kbd>'</kbd> + <kbd>'</kbd>: Surround word under the cursor with single quotaion mark
* <kbd>"</kbd> + <kbd>"</kbd>: Surround word under the cursor with double quotaion mark
* <kbd>"</kbd> + <kbd>(</kbd> (or <kbd>"</kbd> + <kbd>)</kbd>): Replace double quoutes with round brackets around a word
* <kbd>(</kbd> + <kbd>"</kbd> (or <kbd>)</kbd> + <kbd>"</kbd>): Replace brackets with round double quoutes around a word 
### Toggle terminal
* <kbd>ctrl</kbd> + <kbd>\\</kbd>: Open/close terminal
* <kbd>ctrl</kbd> + <kbd>e</kbd>: Send the current line to terminal (works also in visual mode)
### Other
* <kbd>f</kbd> + <kbd>f</kbd>: Go the next istance of the highlighted word
* <kbd>g</kbd> + <kbd>l</kbd>: Show info for LSP warning/error (require LSP)
* <kbd>g</kbd> + <kbd>r</kbd>: Show a list of all the use of the highlighted word in the various files (require LSP)
* <kbd>K</kbd> (<kbd>⇧ Shift</kbd> + <kbd>k</kbd>): Show info regarding the identifier under the cursor (require LSP)
* <kbd>Leader</kbd> + <kbd>w</kbd>: Save file
* <kbd>Leader</kbd> + <kbd>z</kbd>: Open Lazygit

## Insert mode
<kbd>j</kbd> + <kbd>k</kbd>: shortcut to normal mode

## Visual mode
* <kbd>></kbd>: indent
* <kbd><</kbd>: unindent
* <kbd>Alt</kbd> + <kbd>k</kbd>: Move selected line(s) up
* <kbd>Alt</kbd> + <kbd>j</kbd>: Move selected line(s) down
* <kbd>g</kbd> + <kbd>c</kbd>: Comment current selection using linewise comment ([numToStr/Comment.nvim][comments_plugin] plugin)
* <kbd>g</kbd> + <kbd>b</kbd>: Comment current selection using blockwise comment ([numToStr/Comment.nvim][comments_plugin] plugin)
* <kbd>ctrl</kbd> + <kbd>e</kbd>: Send the text selected in visual model to the console

## Telescope
* <kbd>Leader</kbd> + <kbd>f</kbd>: Search between files with default telescope
* <kbd>Leader</kbd> + <kbd>t</kbd>: Live grep search (i.e. search in text inside files)
* <kbd>Leader</kbd> + <kbd>s</kbd> + <kbd>1</kbd>: Show all function inside the open file
* <kbd>Leader</kbd> + <kbd>s</kbd> + <kbd>2</kbd>: Show all the variables (and constants) inside the open file
* <kbd>Leader</kbd> + <kbd>b</kbd> + <kbd>b</kbd>: Show the open buffers (tabs)
* <kbd>Leader</kbd> + <kbd>b</kbd> + <kbd>o</kbd>: Show the files open in past
* <kbd>Leader</kbd> + <kbd>b</kbd> + <kbd>r</kbd>: Show the [register][vim_register]
* <kbd>Leader</kbd> + <kbd>b</kbd> + <kbd>p</kbd>: Show the list of project (need the [project][project-plugin] plugin and the [telescope extension][project-plugin-telescope]) 
### Telescope file broweser plugin
* <kbd>Leader</kbd> + <kbd>F</kbd> (<kbd>Leader</kbd> + <kbd>⇧ Shift</kbd> + <kbd>f</kbd>): Search between files ([telescope-file-browser][telescope-file-browser] plugin)
* <kbd>d</kbd> (or  <kbd>Alt</kbd> + <kbd>d</kbd>): remove selected file ([telescope-file-browser][telescope-file-browser] plugin)
* <kbd>c</kbd> (or  <kbd>Alt</kbd> + <kbd>c</kbd>): create file in current location ([telescope-file-browser][telescope-file-browser] plugin)

## nvim-tree
* <kbd>Leader</kbd> + <kbd>e</kbd>: Open nvim-tree file explorer
* <kbd>d</kbd>: Delete file
* <kbd>r</kbd>: Rename file
* <kbd>⏎ Enter</kbd> (or <kbd>o</kbd>): Open file
* <kbd>h</kbd>: Collapse the current folder tree
* <kbd>v</kbd>: Open the file in vertical split
* <kbd>c</kbd>: (copy)  Add the current selection (files and/or folders) to clipboard
* <kbd>x</kbd>: (cut)   Add the current selection (files and/or folders) to clipboard
* <kbd>p</kbd>: (paste) Paste the contents in the clipboard
* <kbd>a</kbd>: Create file

## Lazygit
* <kbd>?</kbd>: Show command 
* <kbd>a</kbd>: Stage/Unstage all 


[telescope-file-browser]:https://github.com/nvim-telescope/telescope-file-browser.nvim
[comments_plugin]:https://github.com/numToStr/Comment.nvim
[vim_register]: https://www.brianstorti.com/vim-registers/
[project-plugin]: https://github.com/ahmedkhalf/project.nvim
[project-plugin-telescope]: https://github.com/nvim-telescope/telescope-project.nvim
