import 'package:asuka/asuka.dart';
import 'package:go_router/go_router.dart';
import 'package:job_timer/app/feature/home/home_router.dart';
import 'package:job_timer/app/feature/login/login_router.dart';
import 'package:job_timer/app/feature/project/detail/project_detail_router.dart';
import 'package:job_timer/app/feature/project/register/project_register_router.dart';
import 'package:job_timer/app/feature/project/task/project_task_router.dart';
import 'package:job_timer/app/feature/splash/splash_router.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

class JobTimerRouters {
  static GoRouter get router {
    return GoRouter(
      observers: [Asuka.asukaHeroController],
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: SplashRouter.router,
          name: SplashRouter.router,
          builder: (context, state) {
            return const SplashRouter();
          },
          // redirect: (context, state) {
          //   if (context.get<SplashController>().state.isLogged) {
          //     return HomeRouter.router;
          //   } else {
          //     return LoginRouter.router;
          //   }
          // },
          routes: [
            GoRoute(
              path: LoginRouter.router,
              name: LoginRouter.router,
              builder: (context, state) {
                return const LoginRouter();
              },
            ),
            GoRoute(
              path: HomeRouter.router,
              name: HomeRouter.router,
              builder: (context, state) {
                return const HomeRouter();
              },
            ),
            GoRoute(
              path: ProjectRegisterRouter.router,
              name: ProjectRegisterRouter.router,
              builder: (context, state) {
                return const ProjectRegisterRouter();
              },
            ),
            GoRoute(
              path: ProjectDetailRouter.router,
              name: ProjectDetailRouter.router,
              builder: (context, state) {
                final projectViewModel = state.extra! as ProjectViewModel;
                return ProjectDetailRouter(
                  projectViewModel: projectViewModel,
                );
              },
            ),
            GoRoute(
              path: ProjectTaskRouter.router,
              name: ProjectTaskRouter.router,
              builder: (context, state) {
                final projectViewModel = state.extra! as ProjectViewModel;
                return ProjectTaskRouter(
                  projectViewModel: projectViewModel,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
