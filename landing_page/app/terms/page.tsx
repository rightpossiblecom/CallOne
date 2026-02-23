import Navbar from "@/components/layout/Navbar";
import Footer from "@/components/landing/Footer";

export default function TermsOfService() {
    return (
        <div className="min-h-screen bg-background text-white selection:bg-brand-500 selection:text-white">
            <Navbar />
            <div className="pt-32 pb-24 max-w-3xl mx-auto px-4 sm:px-6 lg:px-8">
                <h1 className="text-4xl font-extrabold mb-8">Terms of Service</h1>
                <div className="prose prose-invert prose-brand max-w-none text-gray-300 space-y-6">
                    <p>Last Updated: {new Date().toLocaleDateString()}</p>

                    <section>
                        <h2 className="text-2xl font-bold text-white mt-8 mb-4">1. Acceptance of Terms</h2>
                        <p>
                            By downloading and using CallOne ("the App"), you agree to be bound by these Terms of Service. If you do not agree, please do not use the App.
                        </p>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mt-8 mb-4">2. Description of Service</h2>
                        <p>
                            CallOne is a simple habit-tracking and reminder utility designed to help users remember to call personal contacts on a weekly basis. The App is provided "as is" and intended strictly for behavioral tracking (reminders and streaks).
                        </p>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mt-8 mb-4">3. No Professional or Medical Advice</h2>
                        <p>
                            CallOne is a productivity tool. We make no medical, emotional, or therapeutic claims. The App is entirely behavioral and neutral. It is not designed to treat loneliness, depression, or provide emotional therapy.
                        </p>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mt-8 mb-4">4. User Responsibilities</h2>
                        <p>
                            Since the App operates locally on your device, you are solely responsible for managing its content and maintaining your device's security. If you uninstall the App or lose your device, your streak data will be lost, as we do not offer cloud synchronization.
                        </p>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mt-8 mb-4">5. Limitation of Liability</h2>
                        <p>
                            To the absolute maximum extent permitted by law, CallOne and its developers shall not be liable for any direct, indirect, incidental, or consequential damages resulting from the use or inability to use the App, missed calls, or lost data.
                        </p>
                    </section>
                </div>
            </div>
            <Footer />
        </div>
    );
}
