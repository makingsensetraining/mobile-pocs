using Autofac;
using MvvmCross.Core.ViewModels;
using MvvmSeed.Application.ViewModels;

namespace MvvmSeed.Application.Modules
{
    public class ApplicationModule : Module
    {
        protected override void Load(ContainerBuilder cb)
        {
            cb.Register(c => new MvxAppStart<SampleViewModel>()).As<IMvxAppStart>().SingleInstance();
        }
    }
}
