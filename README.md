# learning linux
practice Linux
## Cheat sheet
- ~ - home dir / $ standard user / # root user / Linux is case sensitive 
- dir - lists directories and files in current dir - | dir / dir yourDirName
- ls - list storage / lists files or folders in current dir | ls / ls new-dir
- *switches* - -l = long list / -la = full details (perms, date, user) / -a = all | ls -a 
- pwd - print working directory - full path/absolute path
- cd - change directory | cd /dir | cd .. (up one lvl) | cd ~ (goes to home dir)
- mkdir - create dir | mkdir newdir / `mkdir newdir1 newdir2 newdir3`
- touch - create file | `touch newfile.txt`
- rm - deletes dir or file | rm dir / rm file.txt / rm -r newdir2 (dels dir) 
- rmdir - removes empty dir | rmdir dir1 / rmdir * (all empty dir del)
- cp - copy file/dir from 1 loc to another  
-- `cp oldfile.txt /dir2/newfile.txt` - copy, rename, move to another dir  
-- `cp ~/.bashrc bashrc` - cp from home to current dir 
- mv - renames file | `mv newcopy.txt newcopy2.txt`
- echo - prints message | echo Hello World 
- cat - prints content in file | cat newcopy2.txt 
- cat > - outputs to new file created or replaces old text if file already exists | `cat > file2.txt` | `ls -al / > file.txt` (full filesystem and hidden files)
- cat >> - appends to bottom | `cat >> newfile.txt`
- ctrl + d - done - after typing text (cat > newfile.txt)
- 2> - redirects error msgs | `ls -l video.mpg blah.foo 2> errors.txt` / see 'STDERR'
- | - piping - output one cmd/prog and inputs to another |`ls -al | cat > lsout.txt` (list files in current dir inside lsout.txt)
- `echo Hello World | cat >> newfile.txt` - adds message to bottom of newfile.txt 
- head - lists 1st 10 lines in file | head file.txt / `head -20 file.txt` - view 20 lines
- tail - lists last 10 lines in file | `tail file.txt`

### Extras
- -h or --help - short desc / long desc with options of a cmd | pushd -h / mkdir --help
- man - manual/man pages - desc, name, options | man appname
- more - prints content in file / spacebar to go page to page | more newfile.txt 
- less - use arrows to read content 
- sed - find and replace keyword | `sed 's/mysql/MySQL/g file.txt > newfile.txt'` 
-- s - search term, g - to replace globally, '>' - to save results to newfile 
-- replace 'g' with a number and will replace that occurence of the word ('sed s/mysql/MySQL/2' = 2nd occurence replaced)
- pushd - jump from current dir to another | pushd /dir
- popd - back to last dir. used after pushd cmd
- wc - counts lines (-l), words (-w), characters (-c) in file | wc - lw newcopy2.txt
- uniq - removes dupes in file | uniq file.txt
- history - lists all cmds typed
- locate - locate file in dir with this keyword or locate app | locate keyword
- sudo updatedb - use to quickly update db if file not found with 'locate'
- apt-get - install/update/upgrade software packages | `apt-get install pkgname`
-- apt-get remove pkgname 
-- apt-get purge pkgname - removes pkg and config files 
-- apt-get update - update out-of-date pkgs 
-- apt-get upgrade - upgrade out-of-date pkgs 
- git clone - clone software | `git clone (github URL)`
- which - find out if app/cmd is installed | which appname
- whatis - short info about a cmd | whatis pushd 
- whereis - locate binary file, get source, man page, location of file
- whoami - displays username
- egrep or egrep - searches and prints every line with keyword | `egrep 'keyword' file.txt`
-- -c - how many lines matched, -n - matches and line number 
- ps - lists processes running on terminal | ps aux 
- top - processes running the most resources
- kill - used to end process | kill -15 (PID#) | kill (PID#), PID - process ID #, listed under ps or top 
- jobs - displays list of current jobs running in bg
- fg - moves a background process into the foreground | fg (job #)
- ctrl + z - pauses process and moves to bg
- advanced - [regular expressions](https://ryanstutorials.net/linuxtutorial/grep.php#reoverview)
### Shortcuts
- Tab - autocompletes file or dir name 
- clear or ctrl + l - clears screen
- ctrl + c - stops/cancels program running
- ctrl + d - done - after typing text (cat > newfile.txt)
- ctrl + shift / ctrl + - larger/smaller text
- ctrl + u - removes all text before cursor, ctrl + y to paste erased text
- ctrl + k - removes all text after cursor, ctrl + y to paste erased text 
- ctrl + a - moves cursor to beginning of line
- ctrl + e - moves cursor to end of line
- ctrl + r and type 1st few letters from previous cmds - searches for cmds used, press enter to run or Esc to end search
- exit - exits terminal 

### File permissions
View files and perms with 'ls -l'. File perms are in 1st col. 
- Example: `drwxr-xr-x`. 1st charac is the file type. d = dir or '-' for file 
-- r = readable means can view file, w = writable means can edit/del file, x = executable means can execute and access file/dir. 
-- rwx means full access and a dash means no access given.  
- There are 3 sets - user, group, others (UGO). 
-- 1st set/1st 4 chars - 'drwx' in this dir, user/owner has full rwx perms. 
-- 2nd set/5-7th chars - 'r-x' - this group can read (r) and execute (x) but not write (w). 
-- 3rd set/8-10th chars - 'r-x' - all other users can read (r) and execute (x) but not write (w).
-- r = 4 bits, w = 2 bits, x = 1 bit = 4+2+1 = 7 bits / rwx = 777 = full access / 774 = all perms to user and group, read perms to others / 766 = user has rwx, all others and group rw only (4+2=6)
- For more info - [chmod Command in Linux](https://linuxize.com/post/chmod-command-in-linux/) and [commands with examples](https://tecadmin.net/chmod-command-in-linux-with-examples/)
- chmod - change perms/mode, root user or file owner only. | `chmod 774 file.txt`

- UGO (text) method instead of numeric (777)
-- References: (u) user, (g) group, (o) others
-- Operators: - = removes, + = adds, = sets
-- Modes: (r) read, (w) write, (x) execute
- Examples:
-- `chmod u-w file.txt` (removes w perm for user) 
-- `chmod u+x, o+x file.txt` (user and others can execute to file.txt)
-- `chmod ugo=rx file.txt` (everyone has rx perms)
-- `chmod a=rx file.txt` (same as ugo, all users have rx perms)
-- `chmod ugo+rwx file.txt` (all perms to all users)

## Bash scripting
- Begin with `#!/bin/bash` (saved as .sh file by default). 
- New scripts are NOT executable. `chmod 755 bashfile.sh` or `chmod +x bashfile.sh` to make it executable. 
- Commands work exactly the same on the command line as they do within a script. 
- To run file `./bashfile` in the terminal. (./ = to run script)
- Comments 
-- single line `# your comment`
-- multi-line 
```
  :'your comment in between single quotes
  next line
  another line'
```
- = - to set variable, $ - call var | `myvar="yo world" echo $myvar` - outputs 'yo world' when your run script
- if statements 
```
if [ statement ] 
then 
  echo 'your message' 
  exit
fi

else
  echo 'another message'
fi  
```