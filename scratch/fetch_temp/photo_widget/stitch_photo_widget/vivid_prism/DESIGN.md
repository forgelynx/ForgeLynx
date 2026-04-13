# Design System Document

## 1. Overview & Creative North Star: "The Living Gallery"

This design system is not a static utility; it is a **Living Gallery**. For a creative photo widget app, the UI must never compete with the user’s content; it must frame it with editorial intentionality. We move away from the "app-grid" look and toward a fluid, expressive environment that feels organic and curated.

**The Creative North Star** is defined by **Dynamic Asymmetry**. We reject the rigid, centered uniformity of standard Material 3. Instead, we utilize "squircies" (smooth cornered shapes) and organic forms to create a sense of motion. By leaning into generous whitespace (Negative Space as a Feature), we allow the vibrant `primary` and `secondary` tones to act as emotional accents rather than just functional indicators.

---

## 2. Colors & Surface Philosophy

The palette is a high-energy mix of warm ochres (`primary: #af2700`) and deep electric blues (`secondary: #0055c4`), set against a sophisticated, "blush-tinted" neutral base.

### The "No-Line" Rule
**Explicit Instruction:** Designers are prohibited from using 1px solid borders to define sections. Layout boundaries must be established exclusively through:
1.  **Tonal Shifts:** Placing a `surface-container-low` element against a `surface` background.
2.  **Negative Space:** Using at least `spacing-8` to separate distinct functional groups.

### Surface Hierarchy & Nesting
Treat the interface as a physical stack of fine, semi-translucent paper.
*   **Base Level:** `surface` (#fff4f3) – The canvas.
*   **Lowered Areas:** `surface-container-low` (#ffedec) – For background grouping of non-interactive content.
*   **Elevated Components:** `surface-container-highest` (#ffd2d1) – For interactive cards that need to "pop" against the canvas.
*   **The "Glass" Rule:** For floating overlays (Modals, FABs), use `surface-container-lowest` (#ffffff) with an 80% opacity and a `20px` backdrop-blur. This allows the vibrant photo content beneath to "bleed" through the UI, maintaining a sense of place.

### Signature Textures
Apply a subtle linear gradient to main CTAs: `primary` (#af2700) to `primary-container` (#ff7856) at a 135° angle. This adds a "lithographic" depth that flat hex codes cannot achieve.

---

## 3. Typography: The Editorial Voice

We utilize a pairing of **Epilogue** (Display/Headline) for character and **Plus Jakarta Sans** (Body/Label) for modern, high-readability performance.

*   **Display & Headlines (Epilogue):** These are your "Posters." Use `display-lg` and `headline-md` with tight letter-spacing (-0.02em) to create a bold, editorial impact.
*   **Body & UI (Plus Jakarta Sans):** Use `body-lg` for all user-generated captions and `label-md` for functional metadata.
*   **Hierarchy Note:** Always contrast a `display-sm` headline in `on-surface` (#4e2122) with a `label-md` sub-header in `secondary` (#0055c4) to create a sophisticated, multi-tonal typographic rhythm.

---

## 4. Elevation, Depth & The "Ghost Border"

Hierarchy is achieved through **Tonal Layering**, not structural shadows.

*   **Layering Principle:** To lift a photo widget, place it on a `surface-container-highest` card. The delta between `#fff4f3` (Base) and `#ffd2d1` (Card) provides enough contrast for the eye to perceive depth naturally.
*   **Ambient Shadows:** If a "floating" state is required (e.g., a dragged widget), use a shadow with a `40px` blur, `0px` spread, and 6% opacity, tinted with `primary` (#af2700). Never use pure black or grey shadows.
*   **The Ghost Border:** If a boundary is required for accessibility, use `outline-variant` (#df9c9b) at **15% opacity**. It should be felt, not seen.

---

## 5. Components & Primitive Styling

### Expressive Shapes (The "Squirclie")
All interactive containers must use the **Roundedness Scale**. 
*   **Cards/Widgets:** Use `xl` (3rem) for a friendly, organic feel.
*   **Buttons:** Use `full` (pill-shape).
*   **Small Elements (Chips):** Use `md` (1.5rem).

### Buttons
*   **Primary:** Gradient fill (`primary` to `primary-container`), `on-primary` text. No shadow.
*   **Secondary:** `secondary-container` fill with `on-secondary-container` text.
*   **Tertiary:** Ghost style. No fill, `tertiary` (#6d5a00) text, bold weight.

### Cards & Photo Containers
*   **Rule:** Forbid divider lines. Separate metadata from images using `spacing-3`.
*   **Layout:** Use asymmetrical padding (e.g., `padding-top: 6`, `padding-bottom: 4`) to give the app a "scrapbook" aesthetic.

### Creative Photo Widgets (App Specific)
*   **Organic Frame:** Use CSS `clip-path` or SVG masks to create non-perfect circular frames (blob shapes) for "Photo of the Day" widgets.
*   **The Stack:** For photo groups, use a "fanned" layout where cards are rotated ±2 degrees to break the digital grid.

---

## 6. Do’s and Don’ts

### Do:
*   **Do** use `spacing-12` and `spacing-16` for "heroic" whitespace between major sections.
*   **Do** use `tertiary-container` (#fdd400) for "Highlight" or "New" badges to create a vibrant pop against the red/blue core.
*   **Do** animate transitions using a "Spring" curve (stiffness: 300, damping: 20) to match the organic visual language.

### Don’t:
*   **Don’t** use pure `#000000` for text. Always use `on-surface` (#4e2122) to maintain the warm, premium feel.
*   **Don’t** use a standard 4-column grid. Experiment with a 3-column "Editorial" grid where elements span 1 or 2 columns asymmetrically.
*   **Don’t** use square corners. Even the smallest icon button must have at least `sm` (0.5rem) rounding.