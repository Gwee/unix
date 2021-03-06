#!/usr/bin/awk -f
function get_rentals_from_renter(renter,from_arg,to_arg){
    while (getline < "rentfile"){
        split_line()
        #if date > ... write to rentals.txt...
        if (is_date_less_than(to_date,to_arg)=="YES" && is_date_less_than(from_arg,from_date) == "YES") {
            print $0 > "rentals"
        }
        if (to_date == "-" && is_date_less_than(from_arg,from_date) == "YES"){
            print $0 > "rentals"
        }
    }
    close("rentfile")
}
function number_of_days_in(date1,date2,A,B,d1,d2){
    gsub("/"," ",date1)
    gsub("/"," ",date2)
    split(date1,A," ")
    split(date2,B," ")
    d1=A[3]" "A[2]" "A[1]" "00" "00" "00
    d2=B[3]" "B[2]" "B[1]" "00" "00" "00
    return ((mktime(d2)-mktime(d1))/86400+1)
}
function is_date_less_than(date1,date2,A,d1,d2,m1,m2,y1,y2){
  split(date1,A,"/")
  d1=A[1];m1=A[2];y1=A[3]
  split(date2,A,"/")
  d2=A[1];m2=A[2];y2=A[3]
  if (y1<y2) return "YES"
  if (y1>y2) return "NO"
  if (m1<m2) return "YES"
  if (m1>m2) return "NO"
  if (d1<d2) return "YES"
  return "NO"
}
function split_line(){
    split($0,rentArray,":")
    price=rentArray[0];renter=rentArray[1];car=rentArray[2];from_date=rentArray[3];to_date=rentArray[4]
}
BEGIN  {
    renter=ARGV[1]
    from_arg=ARGV[2]
    to_arg=ARGV[3]
    print renter; print from_arg; print to_arg;
    get_rentals_from_renter(renter,from_arg,to_arg)
    while (getline < "rentals.txt"){
        split_line()
        if (to_date == "-"){
        print $0" "(number_of_days_in(from_date,to_arg)*price)            
        }
        print $0" "(number_of_days_in(from_date,to_date)*price)
    }
}