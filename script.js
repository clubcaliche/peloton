document.addEventListener('DOMContentLoaded', async () => {
    const gallery = document.getElementById('gallery');
    const loader = document.getElementById('loader');
    const errorElement = document.getElementById('error');

    try {
        // Hide loader, show gallery
        loader.style.display = 'none';
        gallery.style.display = 'grid';

        // Use the globally available data from data.js
        const data = pelotonData;

        data.data.forEach((instructor, index) => {
            // Only show instructors that have a valid image and name
            if (!instructor.image_url || !instructor.name) return;

            const polaroid = document.createElement('div');
            polaroid.className = 'polaroid';
            
            // Add slight random rotation to make it feel like scattered polaroids
            const baseRotation = (Math.random() * 10) - 5;
            const randomY = (Math.random() * 20) - 10;
            polaroid.style.transform = `translateY(${randomY}px) rotate(${baseRotation}deg)`;

            const inner = document.createElement('div');
            inner.className = 'polaroid-inner';

            const front = document.createElement('div');
            front.className = 'polaroid-front';

            const back = document.createElement('div');
            back.className = 'polaroid-back';

            // Build front
            const imgWrapper = document.createElement('div');
            imgWrapper.className = 'polaroid-img-wrapper';

            const img = document.createElement('img');
            img.src = instructor.image_url;
            img.alt = instructor.name;
            img.loading = 'lazy';

            const caption = document.createElement('div');
            caption.className = 'caption';
            caption.textContent = instructor.name;

            imgWrapper.appendChild(img);
            front.appendChild(imgWrapper);
            front.appendChild(caption);

            // Build back
            const quoteText = instructor.quote ? instructor.quote : "Let's put in the work!";
            back.innerHTML = `
                <div class="quote-mark">"</div>
                <div class="quote-text">${quoteText}</div>
            `;

            inner.appendChild(front);
            inner.appendChild(back);
            polaroid.appendChild(inner);
            gallery.appendChild(polaroid);

            // Flip on click
            polaroid.addEventListener('click', () => {
                polaroid.classList.toggle('is-flipped');
            });

            // Dynamic hover state handling via JS to preserve the base transform
            polaroid.addEventListener('mouseenter', () => {
                polaroid.style.transform = `translateY(${randomY - 15}px) scale(1.08) rotate(0deg)`;
                // Do not override box-shadow here anymore since it's on the inner cards
                polaroid.style.zIndex = '50';
                img.style.filter = 'grayscale(0%) sepia(0%) contrast(1)';
            });

            polaroid.addEventListener('mouseleave', () => {
                polaroid.style.transform = `translateY(${randomY}px) rotate(${baseRotation}deg)`;
                polaroid.style.zIndex = '1';
                img.style.filter = 'grayscale(100%) sepia(20%) contrast(1.1)';
            });
        });

    } catch (err) {
        console.error("Failed to load instructors:", err);
        loader.style.display = 'none';
        errorElement.style.display = 'block';
        errorElement.textContent = "Oops! We couldn't load the instructors right now. Please refresh and try again.";
    }
});
