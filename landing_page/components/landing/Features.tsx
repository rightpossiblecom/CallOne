import { UserPlus, Bell, Activity, RotateCcw } from "lucide-react";

const features = [
    {
        name: "Focus on One",
        description: "Add just one contact name. No syncing your entire address book. Pure intentionality.",
        icon: UserPlus,
    },
    {
        name: "Weekly Reminder",
        description: "Set your preferred call day (e.g., Sunday). Get a gentle nudge exactly when you want it.",
        icon: Bell,
    },
    {
        name: "Streak Tracking",
        description: "Mark your call as completed and watch your weekly streak grow. Consistency is key.",
        icon: Activity,
    },
    {
        name: "Rotating Mode",
        description: "Keep it fresh by adding up to 3 people. The app automatically rotates them each week.",
        icon: RotateCcw,
    },
];

export default function Features() {
    return (
        <div id="features" className="py-24 bg-background relative overflow-hidden">
            <div className="absolute left-0 top-1/2 -translate-y-1/2 w-96 h-96 bg-accent-500/5 blur-[100px] rounded-full pointer-events-none" />

            <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative">
                <div className="text-center max-w-3xl mx-auto mb-16">
                    <h2 className="text-brand-400 font-semibold tracking-wide uppercase text-sm mb-3">Simple Features</h2>
                    <p className="mt-2 text-3xl leading-8 font-extrabold tracking-tight text-white sm:text-4xl">
                        Everything you need. Nothing you don't.
                    </p>
                    <p className="mt-4 max-w-2xl text-xl text-gray-400 mx-auto">
                        No social network feeds. No messaging. Just a pure habit loop to keep you connected.
                    </p>
                </div>

                <div className="grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-4">
                    {features.map((feature) => (
                        <div key={feature.name} className="glass-card rounded-2xl p-8 hover:bg-white/5 transition-all group">
                            <div className="flex items-center justify-center h-12 w-12 rounded-xl bg-brand-500/10 text-brand-400 mb-6 group-hover:scale-110 group-hover:bg-brand-500/20 transition-all">
                                <feature.icon className="h-6 w-6" aria-hidden="true" />
                            </div>
                            <h3 className="text-xl font-bold text-white mb-3">{feature.name}</h3>
                            <p className="text-gray-400 leading-relaxed">
                                {feature.description}
                            </p>
                        </div>
                    ))}
                </div>
            </div>
        </div>
    );
}
