using Autofac;
using MvvmCross.Core.ViewModels;
using MvvmSeed.Application.Services;
using MvvmSeed.Application.ViewModels;
using MvvmSeed.Domain.Services;
using Realms;

namespace MvvmSeed.Application.Modules
{
    public class ApplicationModule : Module
    {
        protected override void Load(ContainerBuilder cb)
        {
            cb.Register(c => new MvxAppStart<SampleViewModel>()).As<IMvxAppStart>().SingleInstance();
            cb.Register(c => Realm.GetInstance()).As<Realm>().SingleInstance();

            cb.Register(c => new StringRandomizerService(c.Resolve<Realm>())).As<IStringRandomizerService>();
        }
    }
}
