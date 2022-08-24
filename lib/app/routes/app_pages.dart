import 'package:grad/app/bindings/account/account_binding.dart';
import 'package:grad/app/bindings/account/change_password_binding.dart';
import 'package:grad/app/bindings/account/edit_profile_binding.dart';
import 'package:grad/app/bindings/auth/auth_manager_binding.dart';
import 'package:grad/app/bindings/auth/change_password_binding.dart';
import 'package:grad/app/bindings/auth/create_account_binding.dart';
import 'package:grad/app/bindings/auth/forgotten_password_binding.dart';
import 'package:grad/app/bindings/auth/login_binding.dart';
import 'package:grad/app/bindings/auth/verify_account_binding.dart';
import 'package:grad/app/bindings/calendar/calendar_binding.dart';
import 'package:grad/app/bindings/calendar/new_event_binding.dart';
import 'package:grad/app/bindings/home/home_binding.dart';
import 'package:grad/app/bindings/menu/announcement_binding.dart';
import 'package:grad/app/bindings/menu/attendance_binding.dart';
import 'package:grad/app/bindings/menu/classes_binding.dart';
import 'package:grad/app/bindings/menu/results_binding.dart';
import 'package:grad/app/bindings/menu/subjects_binding.dart';
import 'package:grad/app/bindings/menu/users_binding.dart';
import 'package:grad/app/bindings/navigation/navigation_binding.dart';
import 'package:grad/app/bindings/others/success-page-binding.dart';
import 'package:grad/app/bindings/settings/settings_binding.dart';
import 'package:grad/app/bindings/start/welcome_binding.dart';
import 'package:grad/app/routes/app_routes.dart';
import 'package:grad/app/ui/android/screen/account/change_password.dart';
import 'package:grad/app/ui/android/screen/account/edit-profile.dart';
import 'package:grad/app/ui/android/screen/auth/change-password.dart';
import 'package:grad/app/ui/android/screen/auth/create_account.dart';
import 'package:grad/app/ui/android/screen/auth/forgotten_password.dart';
import 'package:grad/app/ui/android/screen/auth/login.dart';
import 'package:grad/app/ui/android/screen/auth/verify-account.dart';
import 'package:grad/app/ui/android/screen/calendar/new_event.dart';
import 'package:grad/app/ui/android/screen/menu/announcement/Announcements.dart';
import 'package:grad/app/ui/android/screen/menu/announcement/Create-announcement.dart';
import 'package:grad/app/ui/android/screen/menu/announcement/edit_announcement.dart';
import 'package:grad/app/ui/android/screen/menu/attendance/add.dart';
import 'package:grad/app/ui/android/screen/menu/attendance/class.dart';
import 'package:grad/app/ui/android/screen/menu/attendance/student.dart';
import 'package:grad/app/ui/android/screen/menu/attendance/view.dart';
import 'package:grad/app/ui/android/screen/menu/calendar/calendar.dart';
import 'package:grad/app/ui/android/screen/menu/calendar/edit_event.dart';
import 'package:grad/app/ui/android/screen/menu/classes/add.dart';
import 'package:grad/app/ui/android/screen/menu/classes/classes.dart';
import 'package:grad/app/ui/android/screen/menu/classes/edit.dart';
import 'package:grad/app/ui/android/screen/menu/classes/parent/class.dart';
import 'package:grad/app/ui/android/screen/menu/classes/student/class.dart';
import 'package:grad/app/ui/android/screen/menu/classes/teacher/class.dart';
import 'package:grad/app/ui/android/screen/menu/classes/view.dart';
import 'package:grad/app/ui/android/screen/menu/parents/add.dart';
import 'package:grad/app/ui/android/screen/menu/parents/edit.dart';
import 'package:grad/app/ui/android/screen/menu/parents/parents.dart';
import 'package:grad/app/ui/android/screen/menu/parents/student/myparent.dart';
import 'package:grad/app/ui/android/screen/menu/parents/view.dart';
import 'package:grad/app/ui/android/screen/menu/results/class.dart';
import 'package:grad/app/ui/android/screen/menu/results/past.dart';
import 'package:grad/app/ui/android/screen/menu/results/students.dart';
import 'package:grad/app/ui/android/screen/menu/staffs/add.dart';
import 'package:grad/app/ui/android/screen/menu/staffs/edit.dart';
import 'package:grad/app/ui/android/screen/menu/staffs/staffs.dart';
import 'package:grad/app/ui/android/screen/menu/staffs/student/myteacher.dart';
import 'package:grad/app/ui/android/screen/menu/staffs/view.dart';
import 'package:grad/app/ui/android/screen/menu/students/add.dart';
import 'package:grad/app/ui/android/screen/menu/students/class.dart';
import 'package:grad/app/ui/android/screen/menu/students/edit.dart';
import 'package:grad/app/ui/android/screen/menu/students/student/classmate.dart';
import 'package:grad/app/ui/android/screen/menu/students/students.dart';
import 'package:grad/app/ui/android/screen/menu/students/view.dart';
import 'package:grad/app/ui/android/screen/menu/subjects/add.dart';
import 'package:grad/app/ui/android/screen/menu/subjects/edit.dart';
import 'package:grad/app/ui/android/screen/menu/subjects/student/subject.dart';
import 'package:grad/app/ui/android/screen/menu/subjects/subjects.dart';
import 'package:grad/app/ui/android/screen/menu/subjects/view.dart';
import 'package:grad/app/ui/android/screen/menu/users/add_users.dart';
import 'package:grad/app/ui/android/screen/menu/users/edit_users.dart';
import 'package:grad/app/ui/android/screen/menu/users/users.dart';
import 'package:grad/app/ui/android/screen/menu/users/view_user.dart';
import 'package:grad/app/ui/android/screen/onboard.dart';
import 'package:grad/app/ui/android/screen/settings/bugs.dart';
import 'package:grad/app/ui/android/screen/settings/notification.dart';
import 'package:grad/app/ui/android/screen/settings/school_configuration.dart';
import 'package:grad/app/ui/android/screen/settings/session.dart';
import 'package:grad/app/ui/android/screen/settings/stamp.dart';
import 'package:grad/app/ui/android/screen/settings/term.dart';
import 'package:grad/app/ui/android/screen/success-page.dart';
import 'package:grad/app/ui/android/widgets/staffs/teachers.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
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
      name: Routes.new_event,
      page: () => NewEvent(),
      binding: NewEventBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.forgotten_password,
      page: () => ForgottenPassword(),
      binding: ForgottenPasswordBinding(),
    ),
    GetPage(
      name: Routes.create_account,
      page: () => CreateAccount(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: Routes.verify_account,
      page: () => VerifyAccount(),
      binding: VerifyAccountBinding(),
    ),
    GetPage(
      name: Routes.change_password,
      page: () => ChangePassword(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: Routes.change_password_account,
      page: () => ChangePasswordAccount(),
      binding: ChangePasswordAccountBinding(),
    ),
    GetPage(
      name: Routes.edit_profile,
      page: () => EditProfle(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: Routes.success_page,
      page: () => SuccessPage(),
      binding: SuccessPageBinding(),
    ),
    GetPage(
      name: Routes.school_configuration,
      page: () => SchoolConfiguration(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.session,
      page: () => Session(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.term,
      page: () => Term(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.stamp,
      page: () => Stamp(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.notification_settings,
      page: () => Notification(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.bugs,
      page: () => Bugs(),
      binding: SettingsBinding(),
    ),

    //menu
    GetPage(
      name: Routes.announcement,
      page: () => Announcements(),
      binding: AnnouncementBinding(),
    ),

    GetPage(
      name: Routes.announcement_add,
      page: () => CreateAnnouncement(),
      binding: AnnouncementBinding(),
    ),

    GetPage(
      name: Routes.announcement_edit,
      page: () => EditAnnouncement(),
      binding: AnnouncementBinding(),
    ),

    GetPage(
      name: Routes.calendar,
      page: () => Calendar(),
      binding: CalendarBinding(),
    ),

    GetPage(
      name: Routes.edit_calender,
      page: () => EditEvent(),
      binding: NewEventBinding(),
    ),

    ///
    /// admin or users
    ///
    GetPage(
      name: Routes.users,
      page: () => Users(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.users_add,
      page: () => AddUser(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.users_edit,
      page: () => EditUser(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.users_view,
      page: () => ViewUser(),
      binding: UsersBinding(),
    ),

    ///
    /// students
    ///
    GetPage(
      name: Routes.class_students,
      page: () => ClassStudents(),
      binding: ClassesBinding(),
    ),

    GetPage(
      name: Routes.students,
      page: () => Students(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.students_edit,
      page: () => EditStudent(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: Routes.student_view,
      page: () => ViewStudent(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: Routes.student_add,
      page: () => AddStudent(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.teachers,
      page: () => Teachers(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.classmates,
      page: () => ClassMates(),
      binding: UsersBinding(),
    ),

    ///
    /// parents
    ///
    GetPage(
      name: Routes.parents,
      page: () => Parents(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.parents_add,
      page: () => AddParent(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.parents_edit,
      page: () => EditParent(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.parents_view,
      page: () => ViewParent(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.myparent,
      page: () => MyParents(),
      binding: UsersBinding(),
    ),

    ///
    /// staffs
    ///
    GetPage(
      name: Routes.staffs,
      page: () => Staffs(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: Routes.staffs_edit,
      page: () => EditStaff(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.staffs_add,
      page: () => AddStaff(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: Routes.staffs_view,
      page: () => ViewStaff(),
      binding: UsersBinding(),
    ),

    GetPage(
      name: Routes.myteacher,
      page: () => MyTeacher(),
      binding: UsersBinding(),
    ),

    ///
    ///  Classes
    ///
    GetPage(
      name: Routes.classes,
      page: () => Classes(),
      binding: ClassesBinding(),
    ),

    GetPage(
      name: Routes.classes_edit,
      page: () => EditClass(),
      binding: ClassesBinding(),
    ),

    GetPage(
      name: Routes.classes_add,
      page: () => AddClass(),
      binding: ClassesBinding(),
    ),

    GetPage(
      name: Routes.classes_view,
      page: () => ViewClass(),
      binding: ClassesBinding(),
    ),

    // student class
    GetPage(
      name: Routes.student_view,
      page: () => StudentClass(),
      binding: ClassesBinding(),
    ),

    // teacher class
    GetPage(
      name: Routes.teacher_class,
      page: () => TeacherClass(),
      binding: ClassesBinding(),
    ),

    // teacher class
    GetPage(
      name: Routes.parent_class,
      page: () => ParentClass(),
      binding: ClassesBinding(),
    ),

    ///
    /// subjects
    ///
    GetPage(
      name: Routes.subjects,
      page: () => Subjects(),
      binding: SubjectsBinding(),
    ),

    GetPage(
      name: Routes.subject_edit,
      page: () => EditSubject(),
      binding: SubjectsBinding(),
    ),

    GetPage(
      name: Routes.subjects_add,
      page: () => AddSubject(),
      binding: SubjectsBinding(),
    ),

    GetPage(
      name: Routes.subject_view,
      page: () => ViewSubject(),
      binding: SubjectsBinding(),
    ),

    // student subject
    GetPage(
      name: Routes.student_subject,
      page: () => StudentSubject(),
      binding: SubjectsBinding(),
    ),

    //results
    GetPage(
      name: Routes.class_results,
      page: () => ClassResult(),
      binding: ClassesBinding(),
    ),

    GetPage(
      name: Routes.students_result,
      page: () => StudentResults(),
      binding: ResultsBinding(),
    ),

    GetPage(
      name: Routes.pasts_results,
      page: () => PastResult(),
      binding: ResultsBinding(),
    ),

    //attendance

    GetPage(
      name: Routes.class_attendance,
      page: () => ClassAttendance(),
      binding: ClassesBinding(),
    ),

    GetPage(
      name: Routes.attendance_view,
      page: () => ViewAttendance(),
      binding: AttendanceBinding(),
    ),
    GetPage(
      name: Routes.attendance_add,
      page: () => AddAttendance(),
      binding: AttendanceBinding(),
    ),
    GetPage(
      name: Routes.attendance_students,
      page: () => StudentAttendance(),
      binding: AttendanceBinding(),
    ),
  ];
}
