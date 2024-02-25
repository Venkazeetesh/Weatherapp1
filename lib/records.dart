
void main(){
  (int,double)?  records=(1,2.4);
  print(records);
  final list =[2,3,4];
  final [a,b,...d]=list;
  print('$a,$b,$d');
  records=null;
  print(records);
}