import Link from "next/link";

export default function Hero() {
    return (
        <div className="relative pt-32 pb-20 lg:pt-48 lg:pb-32 overflow-hidden">
            {/* Background glow effects */}
            <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[800px] h-[800px] bg-brand-500/10 blur-[120px] rounded-full pointer-events-none" />
            <div className="absolute top-0 right-0 w-[500px] h-[500px] bg-accent-500/10 blur-[100px] rounded-full pointer-events-none" />

            <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
                <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full border border-brand-500/30 bg-brand-500/10 text-brand-300 text-sm font-medium mb-8">
                    <span className="flex h-2 w-2 rounded-full bg-brand-400 animate-pulse"></span>
                    Build a weekly call habit
                </div>

                <h1 className="text-5xl md:text-7xl font-extrabold tracking-tight text-white mb-6">
                    Stay <span className="text-transparent bg-clip-text bg-gradient-to-r from-brand-400 to-accent-500">connected.</span>
                </h1>

                <p className="mt-4 max-w-2xl mx-auto text-xl text-gray-400 mb-10">
                    Pick one person. Call them once per week. Stay consistent.
                    CallOne is the simplest way to build a habit of reaching out to the people who matter most.
                </p>

                <div className="flex flex-col sm:flex-row justify-center gap-4">
                    <Link
                        href="#download"
                        className="bg-brand-500 hover:bg-brand-400 text-white px-8 py-3.5 rounded-full font-semibold transition-all shadow-[0_0_20px_rgba(245,158,11,0.4)] hover:shadow-[0_0_35px_rgba(245,158,11,0.6)] flex items-center justify-center"
                    >
                        Get CallOne Free
                    </Link>
                    <Link
                        href="#how-it-works"
                        className="glass-card text-white px-8 py-3.5 rounded-full font-semibold hover:bg-white/5 transition-all flex items-center justify-center"
                    >
                        See how it works
                    </Link>
                </div>
            </div>
        </div>
    );
}
