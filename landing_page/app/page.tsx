import Navbar from "@/components/layout/Navbar";
import Hero from "@/components/landing/Hero";
import Features from "@/components/landing/Features";
import HowItWorks from "@/components/landing/HowItWorks";
import FAQ from "@/components/landing/FAQ";
import Footer from "@/components/landing/Footer";

export default function Home() {
  return (
    <main className="min-h-screen bg-background">
      <Navbar />
      <Hero />
      <Features />
      <HowItWorks />

      {/* App Screen Mockup Preview Section */}
      <div className="py-24 bg-background flex flex-col items-center justify-center relative border-y border-white/5 overflow-hidden">
        <div className="absolute inset-0 bg-brand-500/5 blur-[100px] pointer-events-none" />
        <div className="text-center mb-16 relative z-10">
          <h2 className="text-3xl tracking-tight font-extrabold text-white sm:text-4xl">
            A beautiful, simple interface.
          </h2>
          <p className="mt-4 text-xl text-gray-400">
            Designed to get out of your way and focus on connection.
          </p>
        </div>

        {/* Simple Phone Mockup */}
        <div className="relative w-[300px] h-[600px] glass-card rounded-[3rem] p-4 border-[8px] border-zinc-900 shadow-2xl z-10">
          <div className="w-full h-full bg-[#0a0a0a] rounded-[2.25rem] overflow-hidden flex flex-col">
            <div className="flex-1 p-6 flex flex-col justify-between">
              <div>
                <div className="text-center mb-8 mt-4">
                  <h3 className="text-gray-400 text-sm font-medium">This week</h3>
                  <p className="text-white text-2xl font-bold mt-1">Call Mom</p>
                </div>
                <div className="glass-card rounded-2xl p-4 text-center border-brand-500/20">
                  <p className="text-brand-400 text-sm font-medium">Next reminder</p>
                  <p className="text-white text-lg font-semibold mt-1">Sunday</p>
                </div>
              </div>

              <div className="flex flex-col gap-4">
                <button className="w-full bg-brand-500 text-white rounded-full py-4 font-bold text-lg shadow-[0_0_20px_rgba(245,158,11,0.4)]">
                  📞 Call Now
                </button>
                <button className="w-full glass-card text-white rounded-full py-4 font-semibold text-sm">
                  ✓ Mark as Called
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>

      <FAQ />

      {/* Bottom CTA */}
      <div className="py-24 bg-black text-center border-t border-white/5 relative overflow-hidden" id="download">
        <div className="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-full h-full max-w-3xl bg-brand-500/10 blur-[120px] rounded-full pointer-events-none" />
        <div className="relative z-10 px-4">
          <h2 className="text-3xl font-extrabold text-white sm:text-4xl mb-4">
            Ready to stay connected?
          </h2>
          <p className="text-xl text-gray-400 mb-8 max-w-2xl mx-auto">
            Build a habit of reaching out. No noise, just a simple reminder to call the people who matter.
          </p>
          <button className="bg-brand-500 hover:bg-brand-400 text-white px-8 py-4 rounded-full font-bold transition-all shadow-[0_0_20px_rgba(245,158,11,0.4)] hover:shadow-[0_0_35px_rgba(245,158,11,0.6)] text-lg">
            Download CallOne
          </button>
        </div>
      </div>

      <Footer />
    </main>
  );
}
