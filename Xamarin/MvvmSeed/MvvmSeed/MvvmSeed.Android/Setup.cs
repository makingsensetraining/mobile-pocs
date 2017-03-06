using Android.Content;
using Autofac;
using Autofac.Extras.MvvmCross;
using MvvmCross.Core.ViewModels;
using MvvmCross.Droid.Platform;
using MvvmCross.Platform.IoC;
using MvvmSeed.Application;
using MvvmSeed.Application.Modules;

namespace MvvmSeed.Android
{
    public class Setup : MvxAndroidSetup
    {
        public Setup(Context applicationContext) : base(applicationContext) { }

        protected override IMvxApplication CreateApp() => new App();

        protected override IMvxIoCProvider CreateIocProvider()
        {
            var containerBuilder = new ContainerBuilder();
            containerBuilder.RegisterModule<ApplicationModule>();

            // This is an important step that ensures all the ViewModel's are loaded into the container. Without it, MvvmCross wouldn't register them by itself; needs more investigation.
            var viewModelsAssembly = typeof(App).Assembly;
            containerBuilder.RegisterAssemblyTypes(viewModelsAssembly)
                .AssignableTo<MvxViewModel>()
                .As<IMvxViewModel, MvxViewModel>()
                .AsSelf();

            return new AutofacMvxIocProvider(containerBuilder.Build());
        }
    }
}