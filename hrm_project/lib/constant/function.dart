int cal_leavesday(int leavesminute) {
  double days = leavesminute / (60 * 24);
  return days.toInt();
}

int cal_leaveshour(int leavesminute) {
  double days = leavesminute % (60 * 24);
  double hours = days / 60;
  return hours.toInt();
}

int cal_leavesminute(int leavesminute) {
  double days = leavesminute % (60 * 24);
  double minute = days % 60;
  return minute.toInt();
}
