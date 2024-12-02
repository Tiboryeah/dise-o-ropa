"use client";
import Image from "next/image";
import React from "react";
import { Carousel, Card } from "@/components/ui/apple-cards-carousel";

export function AppleCardsCarouselDemo() {
  const cards = data.map((card, index) => (
    <Card key={card.src} card={card} index={index} />
  ));

  return (
    <div className="w-full h-full py-20">
      <h2 className="max-w-7xl pl-4 mx-auto text-xl md:text-5xl font-bold text-neutral-800 dark:text-neutral-200 font-sans">
        Haz brillar tu imaginación y tu ropa.
      </h2>
      <Carousel items={cards} />
    </div>
  );
}

const DummyContent = () => {
  return (
    <>
      {[...new Array(3).fill(1)].map((_, index) => {
        return (
          <div
            key={"dummy-content" + index}
            className="bg-[#F5F5F7] dark:bg-neutral-800 p-8 md:p-14 rounded-3xl mb-4"
          >
            <p className="text-neutral-600 dark:text-neutral-400 text-base md:text-2xl font-sans max-w-3xl mx-auto">
              <span className="font-bold text-neutral-700 dark:text-neutral-200">
                The first rule of Apple club is that you boast about Apple club.
              </span>{" "}
              Keep a journal, quickly jot down a grocery list, and take amazing
              class notes. Want to convert those notes to text? No problem.
              Langotiya jeetu ka mara hua yaar is ready to capture every
              thought.
            </p>
            <Image
              src="https://assets.aceternity.com/macbook.png"
              alt="Macbook mockup from Aceternity UI"
              height="500"
              width="500"
              className="md:w-1/2 md:h-1/2 h-full w-full mx-auto object-contain"
            />
          </div>
        );
      })}
    </>
  );
};

const data = [
  {
    category: "Diseño de modas",
    title: "Diseña tus propias prendas.",
    src: "https://images.pexels.com/photos/7761829/pexels-photo-7761829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    content: <DummyContent />,
  },
  {
    category: "Productividad",
    title: "Eficienta tus diseños.",
    src: "https://images.pexels.com/photos/8978436/pexels-photo-8978436.jpeg?auto=compress&cs=tinysrgb&w=600",
    content: <DummyContent />,
  },
  {
    category: "Facilidad",
    title: "Solo escoge un color o imágen y arrástrala.",
    src: "https://images.pexels.com/photos/8715868/pexels-photo-8715868.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    content: <DummyContent />,
  },

  {
    category: "Producto",
    title: "Resultados de calidad profesional.",
    src: "https://images.pexels.com/photos/8410998/pexels-photo-8410998.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    content: <DummyContent />,
  },
  {
    category: "Creatividad",
    title: "Herramientas creativas para tu marca.",
    src: "https://images.pexels.com/photos/7256873/pexels-photo-7256873.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    content: <DummyContent />,
  },
  {
    category: "Soporte",
    title: "Soporte siempre disponible para ti.",
    src: "https://images.pexels.com/photos/1714203/pexels-photo-1714203.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    content: <DummyContent />,
  },
];