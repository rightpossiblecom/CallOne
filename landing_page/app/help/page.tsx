import Navbar from "@/components/layout/Navbar";
import Footer from "@/components/landing/Footer";
import { Mail, MessageCircle, Info } from "lucide-react";

export default function HelpCenter() {
    return (
        <div className="min-h-screen bg-background text-white selection:bg-brand-500 selection:text-white">
            <Navbar />
            <div className="pt-32 pb-24 max-w-3xl mx-auto px-4 sm:px-6 lg:px-8">
                <div className="text-center mb-16">
                    <h1 className="text-4xl font-extrabold mb-4">Help Center</h1>
                    <p className="text-xl text-gray-400">Find answers and get support for CallOne.</p>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-8 mb-16">
                    <div className="glass-card p-8 rounded-2xl flex flex-col items-start border border-white/10 hover:border-brand-500/30 transition-all">
                        <div className="bg-brand-500/10 p-3 rounded-lg text-brand-400 mb-4">
                            <Info className="h-6 w-6" />
                        </div>
                        <h3 className="text-xl font-bold text-white mb-2">Getting Started</h3>
                        <p className="text-gray-400 mb-4 flex-grow">
                            Learn how to add your first contact, set your weekly reminder day, and build your call streak.
                        </p>
                        <a href="/#how-it-works" className="text-brand-400 font-semibold hover:text-brand-300">Read guide →</a>
                    </div>

                    <div className="glass-card p-8 rounded-2xl flex flex-col items-start border border-white/10 hover:border-brand-500/30 transition-all">
                        <div className="bg-brand-500/10 p-3 rounded-lg text-brand-400 mb-4">
                            <MessageCircle className="h-6 w-6" />
                        </div>
                        <h3 className="text-xl font-bold text-white mb-2">Common Issues</h3>
                        <p className="text-gray-400 mb-4 flex-grow">
                            Not receiving notifications? Streak reset unexpectedly? Browse our FAQ for quick fixes.
                        </p>
                        <a href="/#faq" className="text-brand-400 font-semibold hover:text-brand-300">View FAQ →</a>
                    </div>
                </div>

                <div className="glass-card rounded-2xl p-8 text-center border border-white/10 relative overflow-hidden">
                    <div className="absolute top-0 right-0 w-64 h-64 bg-accent-500/10 blur-[80px] rounded-full pointer-events-none" />
                    <h2 className="text-2xl font-bold text-white mb-4">Still need help?</h2>
                    <p className="text-gray-400 mb-8 max-w-lg mx-auto">
                        Our support team is always happy to help you stay connected. Send us a message and we'll get back to you as soon as possible.
                    </p>
                    <a
                        href="mailto:support@callone.app"
                        className="inline-flex items-center gap-2 bg-brand-500 hover:bg-brand-400 text-white px-6 py-3 rounded-full font-semibold transition-all shadow-[0_0_15px_rgba(245,158,11,0.3)]"
                    >
                        <Mail className="h-5 w-5" />
                        Contact Support
                    </a>
                </div>
            </div>
            <Footer />
        </div>
    );
}
