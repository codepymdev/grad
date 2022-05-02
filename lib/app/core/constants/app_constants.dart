final kToday = DateTime.now().toUtc();
final kFirstDay = DateTime.utc(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime.utc(kToday.year, kToday.month + 3, kToday.day);

const PER_PAGE = 20;
const PAGE = 1;

const STREAM_API_KEY = "26weyexcgwar";

const ISDEBUGMODE = false;
