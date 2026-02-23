export default function HowItWorks() {
    const steps = [
        {
            number: "01",
            title: "Pick your person",
            description: "Enter the name of the family member or friend you want to stay in touch with.",
        },
        {
            number: "02",
            title: "Get reminded",
            description: "Receive a simple notification on your preferred day every week.",
        },
        {
            number: "03",
            title: "Call & Track",
            description: "Make the call, mark it done, and build your consistency streak.",
        },
    ];

    return (
        <div id="how-it-works" className="py-24 bg-black relative border-y border-white/5">
            <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div className="text-center mb-16">
                    <h2 className="text-3xl font-extrabold text-white sm:text-4xl">
                        How it works
                    </h2>
                    <p className="mt-4 text-xl text-gray-400">
                        Three simple steps to build a lasting habit.
                    </p>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-3 gap-12 text-center relative">
                    <div className="hidden md:block absolute top-12 left-[15%] right-[15%] h-0.5 bg-gradient-to-r from-transparent via-brand-500/30 to-transparent" />

                    {steps.map((step, index) => (
                        <div key={index} className="relative z-10 flex flex-col items-center">
                            <div className="w-24 h-24 rounded-full glass-card flex items-center justify-center text-3xl font-bold text-brand-400 mb-6 shadow-[0_0_30px_rgba(245,158,11,0.15)]">
                                {step.number}
                            </div>
                            <h3 className="text-xl font-bold text-white mb-3">{step.title}</h3>
                            <p className="text-gray-400 max-w-xs">{step.description}</p>
                        </div>
                    ))}
                </div>
            </div>
        </div>
    );
}
