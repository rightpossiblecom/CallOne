"use client";

import { useState } from "react";
import { ChevronDown } from "lucide-react";

const faqs = [
    {
        question: "Do I need to create an account?",
        answer: "No. CallOne stores everything locally on your device. We don't collect any of your data.",
    },
    {
        question: "Can I add more than one person?",
        answer: "The main focus is on one person to keep things simple and intentional. However, you can toggle the 'Rotating Mode' in settings to add up to 3 people that the app will cycle through weekly.",
    },
    {
        question: "What happens if I miss a week?",
        answer: "If the week passes without you marking the call as completed, your streak will reset. Don't worry, the goal is consistency—just start a new streak!",
    },
    {
        question: "Does it record my calls?",
        answer: "Absolutely not. CallOne is just a simple reminder and streak tracker. It does not monitor your calls, access your microphone, or track duration.",
    },
    {
        question: "Can it automatically access my contacts?",
        answer: "No. You simply type in a name. We don't need access to your entire address book.",
    },
];

export default function FAQ() {
    const [openIndex, setOpenIndex] = useState<number | null>(null);

    const toggleFAQ = (index: number) => {
        setOpenIndex(openIndex === index ? null : index);
    };

    return (
        <div id="faq" className="py-24 bg-background">
            <div className="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8">
                <div className="text-center mb-16">
                    <h2 className="text-3xl font-extrabold text-white sm:text-4xl">
                        Frequently Asked Questions
                    </h2>
                    <p className="mt-4 text-xl text-gray-400">
                        Everything you need to know about CallOne.
                    </p>
                </div>

                <div className="space-y-4">
                    {faqs.map((faq, index) => (
                        <div
                            key={index}
                            className="glass-card rounded-2xl overflow-hidden transition-all duration-200"
                        >
                            <button
                                className="w-full px-6 py-5 text-left flex justify-between items-center focus:outline-none"
                                onClick={() => toggleFAQ(index)}
                            >
                                <span className="text-lg font-medium text-white">{faq.question}</span>
                                <ChevronDown
                                    className={`h-5 w-5 text-brand-400 transition-transform duration-200 ${openIndex === index ? "rotate-180" : ""
                                        }`}
                                />
                            </button>
                            <div
                                className={`px-6 pb-5 text-gray-400 transition-all duration-200 ease-in-out ${openIndex === index ? "block opacity-100" : "hidden opacity-0"
                                    }`}
                            >
                                {faq.answer}
                            </div>
                        </div>
                    ))}
                </div>
            </div>
        </div>
    );
}
