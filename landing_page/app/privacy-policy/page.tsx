import Navbar from "@/components/layout/Navbar";
import Footer from "@/components/landing/Footer";

export default function PrivacyPolicy() {
    return (
        <div className="min-h-screen bg-background text-white selection:bg-brand-500 selection:text-white">
            <Navbar />
            <div className="pt-32 pb-24 max-w-3xl mx-auto px-4 sm:px-6 lg:px-8">
                <h1 className="text-4xl font-extrabold mb-8">Privacy Policy</h1>
                <div className="prose prose-invert prose-brand max-w-none text-gray-300 space-y-6">
                    <p>Last Updated: {new Date().toLocaleDateString()}</p>

                    <section>
                        <h2 className="text-2xl font-bold text-white mt-8 mb-4">1. Local Storage First</h2>
                        <p>
                            CallOne is designed to be as private as possible. All of your data, including the names of the contacts you add and your streak history, is stored locally on your device. We do not transmit, sync, or back up this data to any external servers.
                        </p>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mt-8 mb-4">2. Permissions</h2>
                        <p>
                            We only ask for the permissions necessary to operate the app:
                        </p>
                        <ul className="list-disc pl-6 space-y-2 mt-2">
                            <li><strong>Notifications:</strong> To send you weekly reminders to call your selected person.</li>
                            <li><strong>Contacts (Optional):</strong> If you choose to select a name from your phone's address book, the app requests partial read access. This data is never uploaded.</li>
                        </ul>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mt-8 mb-4">3. What We Do NOT Do</h2>
                        <ul className="list-disc pl-6 space-y-2">
                            <li>We do not record your phone calls.</li>
                            <li>We do not monitor your call duration or log your call history.</li>
                            <li>We do not sell, rent, or share any personal information, because we don't collect any.</li>
                            <li>We do not have social network features or messaging systems.</li>
                        </ul>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mt-8 mb-4">4. Changes to This Policy</h2>
                        <p>
                            If we make changes to this privacy policy, we will update the "Last Updated" date at the top of this page. Since CallOne operates primarily offline, any potential future data collection features would be strictly opt-in.
                        </p>
                    </section>

                    <section>
                        <h2 className="text-2xl font-bold text-white mt-8 mb-4">5. Contact Us</h2>
                        <p>
                            If you have any questions or concerns about this privacy policy, please reach out to us at <a href="mailto:support@callone.app" className="text-brand-400 hover:text-brand-300">support@callone.app</a>.
                        </p>
                    </section>
                </div>
            </div>
            <Footer />
        </div>
    );
}
