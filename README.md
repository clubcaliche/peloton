# Peloton Instructors UI

A modern, highly-interactive static web application displaying the roster of Peloton instructors. The project focuses on "Wow factor" design with premium typography, glassmorphism shadows, and a playful 3D-interactive UX.

## Features

- **Pristine Client-Side Architecture:** The application runs entirely in the browser using Vanilla HTML, CSS, and JS. 
- **Scatter-Grid Layout:** A visually arresting Polaroid grid layout that staggers and randomly rotates images to mimic real-world scattered photographs.
- **Micro-Animations:** Fluid, cubic-bezier hover animations that lift and naturally restyle the photos.
- **3D Flip Interactions:** Click any polaroid and watch it seamlessly revolve 180 degrees using CSS 3D transforms to reveal the instructor's personal quote on the backside.
- **Secure Data Strategy:** Instructor JSON data is securely imported as a native variable via `data.js`. This circumvents any local protocol (`file://`) browser CORS blocks and eliminates networking unreliability.

## Installation & Usage

Because the app is entirely static and natively wraps its API JSON data, **there is no build process.** 

You can simply:
1. Clone or download this repository.
2. Double-click the `index.html` file to open it in your browser. 

Everything will function natively right from your desktop!

## Deployment (GitHub Pages)

This project was built explicitly to be a static website ready for GitHub Pages.
1. Push the repository to GitHub.
2. Go to your repository **Settings** > **Pages**.
3. Under "Source", select the main branch and click **Save**. 
4. Your beautiful, interactive gallery is now a live website!