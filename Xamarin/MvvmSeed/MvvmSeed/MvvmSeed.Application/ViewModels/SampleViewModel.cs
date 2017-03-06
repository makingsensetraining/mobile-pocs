using System;
using System.Linq;
using MvvmCross.Core.ViewModels;
using MvvmSeed.Application.ViewModels.Interfaces;

namespace MvvmSeed.Application.ViewModels
{
    public class SampleViewModel : MvxViewModel, ISampleViewModel
    {
        public SampleViewModel()
        {
            DoSomethingCommand = new MvxCommand(DoSomethingCommandExecute);
        }

        public IMvxCommand DoSomethingCommand { get; }

        public string SampleString
        {
            get { return _sampleString; }
            set { _sampleString = value; RaisePropertyChanged(); }
        }
        private string _sampleString = "Hello World!";

        private void DoSomethingCommandExecute()
        {
            //Sample command, just randomly re-arranges SampleString to check databinding works properly
            var random = new Random();
            SampleString = new string(SampleString.ToCharArray().OrderBy(s => random.Next(2) % 2 == 0).ToArray());
        }
    }
}
