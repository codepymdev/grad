import 'package:Grad/app/bindings/account/account_binding.dart';
import 'package:Grad/app/bindings/account/change_password_binding.dart';
import 'package:Grad/app/bindings/account/edit_profile_binding.dart';
import 'package:Grad/app/bindings/auth/auth_manager_binding.dart';
import 'package:Grad/app/bindings/auth/change_password_binding.dart';
import 'package:Grad/app/bindings/auth/create_account_binding.dart';
import 'package:Grad/app/bindings/auth/forgotten_password_binding.dart';
import 'package:Grad/app/bindings/auth/login_binding.dart';
import 'package:Grad/app/bindings/auth/verify_account_binding.dart';
import 'package:Grad/app/bindings/calendar/calendar_binding.dart';
import 'package:Grad/app/bindings/calendar/new_event_binding.dart';
import 'package:Grad/app/bindings/home/home_binding.dart';
import 'package:Grad/app/bindings/menu/announcement_binding.dart';
import 'package:Grad/app/bindings/menu/attendance_binding.dart';
import 'package:Grad/app/bindings/menu/classes_binding.dart';
import 'package:Grad/app/bindings/menu/results_binding.dart';
import 'package:Grad/app/bindings/menu/subjects_binding.dart';
import 'package:Grad/app/bindings/menu/users_binding.dart';
import 'package:Grad/app/bindings/navigation/navigation_binding.dart';
import 'package:Grad/app/bindings/others/success-page-binding.dart';
import 'package:Grad/app/bindings/settings/settings_binding.dart';
import 'package:Grad/app/bindings/start/welcome_binding.dart';
import 'package:Grad/app/routes/app_routes.dart';
import 'package:Grad/app/ui/android/screen/account/change_password.dart';
import 'package:Grad/app/ui/android/screen/account/edit-profile.dart';
import 'package:Grad/app/ui/android/screen/auth/change-password.dart';
import 'package:Grad/app/ui/android/screen/auth/create_account.dart';
import 'package:Grad/app/ui/android/screen/auth/forgotten_password.dart';
import 'package:Grad/app/ui/android/screen/auth/login.dart';
import 'package:Grad/app/ui/android/screen/auth/verify-account.dart';
import 'package:Grad/app/ui/android/screen/calendar/new_event.dart';
import 'package:Grad/app/ui/android/screen/menu/announcement/Announcements.dart';
import 'package:Grad/app/ui/android/screen/menu/announcement/Create-announcement.dart';
import 'package:Grad/app/ui/android/screen/menu/announcement/edit_announcement.dart';
import 'package:Grad/app/ui/android/screen/menu/attendance/add.dart';
import 'package:Grad/app/ui/android/screen/menu/attendance/class.dart';
import 'package:Grad/app/ui/android/screen/menu/attendance/student.dart';
import 'package:Grad/app/ui/android/screen/menu/attendance/view.dart';
import 'package:Grad/app/ui/android/screen/menu/calendar/calendar.dart';
import 'package:Grad/app/ui/android/screen/menu/calendar/edit_event.dart';
import 'package:Grad/app/ui/android/screen/menu/classes/add.dart';
import 'package:Grad/app/ui/android/screen/menu/classes/classes.dart';
import 'package:Grad/app/ui/android/screen/menu/classes/edit.dart';
import 'package:Grad/app/ui/android/screen/menu/classes/parent/class.dart';
import 'package:Grad/app/ui/android/screen/menu/classes/student/class.dart';
import 'package:Grad/app/ui/android/screen/menu/classes/teacher/class.dart';
import 'package:Grad/app/ui/android/screen/menu/classes/view.dart';
import 'package:Grad/app/ui/android/screen/menu/parents/add.dart';
import 'package:Grad/app/ui/android/screen/menu/parents/edit.dart';
import 'package:Grad/app/ui/android/screen/menu/parents/parents.dart';
import 'package:Grad/app/ui/android/screen/menu/parents/student/myparent.dart';
import 'package:Grad/app/ui/android/screen/menu/parents/view.dart';
import 'package:Grad/app/ui/android/screen/menu/results/class.dart';
import 'package:Grad/app/ui/android/screen/menu/results/past.dart';
import 'package:Grad/app/ui/android/screen/menu/results/students.dart';
import 'package:Grad/app/ui/android/screen/menu/staffs/add.dart';
import 'package:Grad/app/ui/android/screen/menu/staffs/edit.dart';
import 'package:Grad/app/ui/android/screen/menu/staffs/staffs.dart';
import 'package:Grad/app/ui/android/screen/menu/staffs/student/myteacher.dart';
import 'package:Grad/app/ui/android/screen/menu/staffs/view.dart';
import 'package:Grad/app/ui/android/screen/menu/students/add.dart';
import 'package:Grad/app/ui/android/screen/menu/students/class.dart';
import 'package:Grad/app/ui/android/screen/menu/students/edit.dart';
import 'package:Grad/app/ui/android/screen/menu/students/student/classmate.dart';
import 'package:Grad/app/ui/android/screen/menu/students/students.dart';
import 'package:Grad/app/ui/android/screen/menu/students/view.dart';
import 'package:Grad/app/ui/android/screen/menu/subjects/add.dart';
import 'package:Grad/app/ui/android/screen/menu/subjects/edit.dart';
import 'package:Grad/app/ui/android/screen/menu/subjects/student/subject.dart';
import 'package:Grad/app/ui/android/screen/menu/subjects/subjects.dart';
import 'package:Grad/app/ui/android/screen/menu/subjects/view.dart';
import 'package:Grad/app/ui/android/screen/menu/users/add_users.dart';
import 'package:Grad/app/ui/android/screen/menu/users/edit_users.dart';
import 'package:Grad/app/ui/android/screen/menu/users/users.dart';
import 'package:Grad/app/ui/android/screen/menu/users/view_user.dart';
import 'package:Grad/app/ui/android/screen/onboard.dart';
import 'package:Grad/app/ui/android/screen/settings/bugs.dart';
import 'package:Grad/app/ui/android/screen/settings/notification.dart';
import 'package:Grad/app/ui/android/screen/settings/school_configuration.dart';
import 'package:Grad/app/ui/android/screen/settings/session.dart';
import 'package:Grad/app/ui/android/screen/settings/stamp.dart';
import 'package:Grad/app/ui/android/screen/settings/term.dart';
import 'package:Grad/app/ui/android/screen/success-page.dart';
import 'package:Grad/app/ui/android/widgets/staffs/teachers.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => OnBoard(),
      bindings: [
        AuthManagerBinding(),
        WelcomeBinding(),
        NavigationBinding(),
        HomeBinding(),
        AccountBinding(),
        CalendarBinding(),
      ],
    ),

    GetPage(
      name: Routes.NEW_EVENT,
      page: () => NewEvent(),
      binding: NewEventBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.FORGOTTEN_PASSWORD,
      page: () => ForgottenPassword(),
      binding: ForgottenPasswordBinding(),
    ),
    GetPage(
      name: Routes.CREATE_ACCOUNT,
      page: () => CreateAccount(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: Routes.VERIFY_ACCOUNT,
      page: () => VerifyAccount(),
      binding: VerifyAccountBinding(),
    ),
    GetPage(
      name: Routes.CHANGE_PASSWORD,
      page: () => ChangePassword(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: Routes.CHANGE_PASSWORD_ACCOUNT,
      page: () => ChangePasswordAccount(),
      binding: ChangePasswordAccountBinding(),
    ),
    GetPage(
      name: Routes.EDIT_PROFILE,
      page: () => EditProfle(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: Routes.SUCCESS_PAGE,
      page: () => SuccessPage(),
      binding: SuccessPageBinding(),
    ),
    GetPage(
      name: Routes.SCHOOL_CONFIGURATION,
      page: () => SchoolConfiguration(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.SESSION,
      page: () => Session(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.TERM,
      page: () => Term(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.STAMP,
      page: () => Stamp(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATIONS_SETTINGS,
      page: () => Notification(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.BUGS,
      page: () => Bugs(),
      binding: SettingsBinding(),
    ),

    //menu
    GetPage(
      name: Routes.ANNOUNCEMENTS,
      page: () => Announcements(),
      binding: AnnouncementBinding(),
    ),

    GetPage(
      name: Routes.ANNOUNCEMENT_ADD,
      page: () => CreateAnnouncement(),
      binding: AnnouncementBinding(),
    ),

    GetPage(
      name: Routes.ANNOUNCEMENT_EDIT,
      page: () => EditAnnouncement(),
      binding: AnnouncementBinding(),
    ),

    GetPage(
      name: Routes.CALENDAR,
      page: () => Calendar(),
      binding: CalendarBinding(),
    ),

    GetPage(
      name: Routes.EDIT_CALENDAR,
      page: () => EditEvent(),
      binding: NewEventBinding(),
    ),

    ///
    /// admin or users
    ///
    GetPage(
      name: Routes.USERS,
      page: () => Users(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.USERS_ADD,
      page: () => AddUser(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.USERS_EDIT,
      page: () => EditUser(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.USERS_VIEW,
      page: () => ViewUser(),
      binding: UsersBinding(),
    ),

    ///
    /// students
    ///
    GetPage(
      name: Routes.CLASS_STUDENT,
      page: () => ClassStudents(),
      binding: ClassesBinding(),
    ),

    GetPage(
      name: Routes.STUDENTS,
      page: () => Students(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.STUDENT_EDIT,
      page: () => EditStudent(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: Routes.STUDENT_VIEW,
      page: () => ViewStudent(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: Routes.STUDENT_ADD,
      page: () => AddStudent(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.TEACHERS,
      page: () => Teachers(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.CLASSMATES,
      page: () => ClassMates(),
      binding: UsersBinding(),
    ),

    ///
    /// parents
    ///
    GetPage(
      name: Routes.PARENTS,
      page: () => Parents(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.PARENTS_ADD,
      page: () => AddParent(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.PARENTS_EDIT,
      page: () => EditParent(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.PARENTS_VIEW,
      page: () => ViewParent(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.MYPARENT,
      page: () => MyParents(),
      binding: UsersBinding(),
    ),

    ///
    /// staffs
    ///
    GetPage(
      name: Routes.STAFFS,
      page: () => Staffs(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: Routes.STAFFS_EDIT,
      page: () => EditStaff(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.STAFFS_ADD,
      page: () => AddStaff(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: Routes.STAFFS_VIEW,
      page: () => ViewStaff(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.MYTEACHER,
      page: () => MyTeacher(),
      binding: UsersBinding(),
    ),

    ///
    ///  Classes
    ///
    GetPage(
      name: Routes.CLASSES,
      page: () => Classes(),
      binding: ClassesBinding(),
    ),

    GetPage(
      name: Routes.CLASSES_EDIT,
      page: () => EditClass(),
      binding: ClassesBinding(),
    ),

    GetPage(
      name: Routes.CLASSES_ADD,
      page: () => AddClass(),
      binding: ClassesBinding(),
    ),

    GetPage(
      name: Routes.CLASSES_VIEW,
      page: () => ViewClass(),
      binding: ClassesBinding(),
    ),

    // student class
    GetPage(
      name: Routes.STUDENT_CLASS,
      page: () => StudentClass(),
      binding: ClassesBinding(),
    ),

    // teacher class
    GetPage(
      name: Routes.TEACHER_CLASS,
      page: () => TeacherClass(),
      binding: ClassesBinding(),
    ),

    // teacher class
    GetPage(
      name: Routes.PARENT_CLASS,
      page: () => ParentClass(),
      binding: ClassesBinding(),
    ),

    ///
    /// subjects
    ///
    GetPage(
      name: Routes.SUBJECTS,
      page: () => Subjects(),
      binding: SubjectsBinding(),
    ),

    GetPage(
      name: Routes.SUBJECTS_EDIT,
      page: () => EditSubject(),
      binding: SubjectsBinding(),
    ),

    GetPage(
      name: Routes.SUBJECTS_ADD,
      page: () => AddSubject(),
      binding: SubjectsBinding(),
    ),

    GetPage(
      name: Routes.SUBJECTS_VIEW,
      page: () => ViewSubject(),
      binding: SubjectsBinding(),
    ),

    // student subject
    GetPage(
      name: Routes.STUDENT_SUBJECT,
      page: () => StudentSubject(),
      binding: SubjectsBinding(),
    ),

    //results
    GetPage(
      name: Routes.CLASS_RESULTS,
      page: () => ClassResult(),
      binding: ClassesBinding(),
    ),

    GetPage(
      name: Routes.STUDENTS_RESULTS,
      page: () => StudentResults(),
      binding: ResultsBinding(),
    ),

    GetPage(
      name: Routes.PAST_RESULTS,
      page: () => PastResult(),
      binding: ResultsBinding(),
    ),

    //attendance

    GetPage(
      name: Routes.CLASS_ATTENDANCE,
      page: () => ClassAttendance(),
      binding: ClassesBinding(),
    ),

    GetPage(
      name: Routes.ATTENDANCE_VIEW,
      page: () => ViewAttendance(),
      binding: AttendanceBinding(),
    ),
    GetPage(
      name: Routes.ATTENDANCE_ADD,
      page: () => AddAttendance(),
      binding: AttendanceBinding(),
    ),
    GetPage(
      name: Routes.ATTENDANCE_STUDENT,
      page: () => StudentAttendance(),
      binding: AttendanceBinding(),
    ),
  ];
}
