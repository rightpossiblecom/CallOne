import Navbar from "@/components/layout/Navbar";
import Footer from "@/components/landing/Footer";
import { Mail, Twitter, Github } from "lucide-react";

export default function Contact() {
    return (
        <div className="min-h-screen bg-background text-white selection:bg-brand-500 selection:text-white">
            <Navbar />
            <div className="pt-32 pb-24 max-w-3xl mx-auto px-4 sm:px-6 lg:px-8">
                <h1 className="text-4xl font-extrabold mb-8 text-center">Contact Us</h1>
                <p className="text-xl text-gray-400 text-center mb-16 max-w-xl mx-auto">
                    We're here to answer any questions or receive your feedback on how we can make CallOne better.
                </p>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
                    <div className="glass-card p-8 rounded-2xl flex flex-col items-center text-center border border-white/10">
                        <div className="bg-brand-500/10 p-4 rounded-full text-brand-400 mb-4 shadow-[0_0_15px_rgba(245,158,11,0.2)]">
                            <Mail className="h-8 w-8" />
                        </div>
                        <h3 className="text-xl font-bold text-white mb-2">Email Support</h3>
                        <p className="text-gray-400 mb-4">
                            For any general inquiries, feedback, or support requests, email us directly.
                        </p>
                        <a href="mailto:support@callone.app" className="text-brand-400 font-bold hover:underline">
                            support@callone.app
                        </a>
                    </div>

                    <div className="glass-card p-8 rounded-2xl flex flex-col items-center text-center border border-white/10">
                        <div className="bg-accent-500/10 p-4 rounded-full text-accent-500 mb-4 shadow-[0_0_15px_rgba(244,63,94,0.2)]">
                            <Twitter className="h-8 w-8" />
                        </div>
                        <h3 className="text-xl font-bold text-white mb-2">Social Media</h3>
                        <p className="text-gray-400 mb-4">
                            Follow us on Twitter for updates, tips, and news about the app.
                        </p>
                        <a href="https://twitter.com/calloneapp" className="text-accent-500 font-bold hover:underline" target="_blank" rel="noopener noreferrer">
                            @CallOneApp
                        </a>
                    </div>
                </div>
            </div>
            <Footer />
        </div>
    );
}
