import Link from "next/link";
import Image from "next/image";

export default function Navbar() {
    return (
        <nav className="fixed top-0 w-full z-50 glass-card border-b border-white/5 bg-background/50 backdrop-blur-md">
            <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div className="flex justify-between items-center h-16">
                    <div className="flex-shrink-0 flex items-center gap-3">
                        <Image src="/logo.png" alt="CallOne Logo" width={32} height={32} className="rounded-lg" />
                        <span className="font-bold text-xl tracking-tight text-white">CallOne</span>
                    </div>
                    <div className="hidden md:flex space-x-8">
                        <Link href="#features" className="text-gray-300 hover:text-brand-400 transition-colors text-sm font-medium">Features</Link>
                        <Link href="#how-it-works" className="text-gray-300 hover:text-brand-400 transition-colors text-sm font-medium">How it Works</Link>
                        <Link href="#faq" className="text-gray-300 hover:text-brand-400 transition-colors text-sm font-medium">FAQ</Link>
                    </div>
                    <div className="flex items-center">
                        <Link
                            href="#download"
                            className="bg-brand-500 hover:bg-brand-400 text-white px-5 py-2 rounded-full text-sm font-medium transition-all shadow-[0_0_15px_rgba(245,158,11,0.3)] hover:shadow-[0_0_25px_rgba(245,158,11,0.5)]"
                        >
                            Get CallOne
                        </Link>
                    </div>
                </div>
            </div>
        </nav>
    );
}
