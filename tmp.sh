##save to /test.sh & chmod 755
it=0
echo "started $it" >/tmp/ll.log
while true; do
    it=$((it + 1))
    sleep 3
    echo " running $it" >/tmp/ll.log
    if [ $it -gt 20 ]; then
        exit 0
    fi
done

#start service
(/test.sh) & echo "$!" >/test.pid

#stopservice

kill "$(cat /test.pid)"
#or
kill -s 9 "$(cat /test.pid)"

#check is running 
kill -s 0 $(cat /test.pid) &>/dev/null
if [ $? -eq 0 ]; then
    echo "running"
else
    echo "stopped"
fi


#And also if you want to drop stdin/stdout:
# (( command 0<&- &>/dev/null &) &)

# A) Backgrounding a command directly
sleep 2 &
ps
# A) backgrounding a subhell (with similar tas)
(sleep 2) &
ps
