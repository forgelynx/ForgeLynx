# Design System Document: The Serene Interval

## 1. Overview & Creative North Star
**Creative North Star: "The Temporal Sanctuary"**
This design system moves beyond the utility of a "timer" and into the realm of a "digital heirloom." While it remains 100% Material 3 Expressive compliant, it rejects the cluttered, utility-first density of standard apps in favor of an editorial, spacious experience. 

The system is built on **Intentional Asymmetry** and **Tonal Depth**. By leveraging the expressive capabilities of Material You, we create a sanctuary for time—where the countdown isn't a source of anxiety, but a beautiful, rhythmic progression. We achieve a premium feel by prioritizing "white space" (negative space) as a core functional element, allowing the typography to breathe and the surfaces to glow.

## 2. Colors & Surface Architecture
The color strategy relies on a sophisticated palette of muted blues, slate greys, and deep indigos. We move away from flat UI by utilizing M3’s tonal surface system.

### The "No-Line" Rule
Traditional borders are prohibited. Sectioning must be achieved through **Surface Transitions**. Boundaries are defined solely by shifting from `surface` (#f6faff) to `surface-container-low` (#eaf5ff) or `surface-container` (#def0ff). This creates a "soft-edge" layout that feels organic and premium.

### Surface Hierarchy & Nesting
Instead of a flat grid, treat the UI as a series of physical layers.
*   **Level 0 (Base):** `surface` or `surface-container-lowest` (#ffffff).
*   **Level 1 (Sectioning):** Use `surface-container-low` to define broad areas of interest.
*   **Level 2 (Interactive Elements):** Use `surface-container-high` (#d3ecff) for active cards.
*   **Level 3 (Emphasis):** Use `primary-container` (#cfe6f2) to highlight the "active" countdown.

### Signature Textures
Main CTAs or hero countdown displays should not be flat. Apply a subtle **Linear Gradient** from `primary` (#4d626c) to `primary-dim` (#415660) at a 135-degree angle to provide a sense of weight and professional polish.

## 3. Typography: The Editorial Voice
We use a dual-font strategy to balance authoritative presence with high readability.

*   **The Display Scale (Plus Jakarta Sans):** Used for the time remaining. `display-lg` (3.5rem) should be used for the primary countdown digits, creating a bold, clock-face presence.
*   **The Narrative Scale (Manrope):** Used for all body text and metadata. The geometric nature of Manrope provides a modern, "tech-forward" feel that complements the expressive headings.
*   **Hierarchy Tip:** Use `label-md` (#39647e) in all-caps with 0.05rem letter spacing for "Time Units" (DAYS, HOURS, MINUTES) to create a sophisticated, architectural look.

## 4. Elevation & Depth: Tonal Layering
In the Expressive M3 spec, elevation is signaled by color, not shadows.

*   **The Layering Principle:** To lift a card, do not add a shadow. Instead, place a `surface-container-lowest` card on a `surface-container` background. The contrast in brightness provides the "lift."
*   **Ambient Shadows (The Exception):** For floating action buttons (FAB) or critical overlays, use a "Tinted Shadow." Use the `on-surface` color (#00364e) at 6% opacity with a 24px blur and 8px offset. This mimics natural light passing through a translucent object.
*   **The "Ghost Border" Fallback:** If high-contrast accessibility is required, use the `outline-variant` (#8db7d5) at **15% opacity**. This creates a whisper of a boundary that does not break the "No-Line" rule.

## 5. Components
All components follow the **Full Roundness** mandate of the Expressive scale.

### Buttons
*   **Primary:** Fully rounded (`shape-full`). Background: `primary` (#4d626c). Text: `on-primary` (#f2faff). Use for "Start Countdown."
*   **Secondary/Tonal:** Background: `secondary-container` (#dff4ff). Text: `on-secondary-container` (#4a5d66). Use for "Edit" or "Pause."

### Cards & Lists
*   **Forbid Dividers:** Do not use `outline` or lines to separate list items. Use a 16px or 24px vertical gap.
*   **The "Floating Card":** Use `surface-container-high` for countdown cards. Apply `xl` (3rem) corner radius for an ultra-modern, friendly appearance.

### The "Temporal Progress" Indicator
Instead of a thin line, use a **Thick Segmented Bar**. Use `tertiary-container` (#a8b5fd) for the track and `tertiary` (#4e5b9c) for the progress. Ensure the ends are fully rounded.

### Chips
*   **Input/Filter Chips:** Use for tags like "Work," "Personal," or "Anniversary." Use `surface-container-highest` (#c6e7ff) for the unselected state and `primary-container` for the selected state.

## 6. Do’s and Don'ts

### Do:
*   **Embrace the Void:** Use generous padding (32px+) around the main countdown digits.
*   **Layer with Intent:** Ensure that each "step" in elevation corresponds to a step in the `surface-container` token scale.
*   **Use Dynamic Color:** Ensure the system survives a color shift. Test your layout against the `error` (#ac3434) and `tertiary` (#4e5b9c) palettes to ensure tonal logic holds up.

### Don't:
*   **Don't use 1px lines:** Even for dividers. Use whitespace or color shifts instead.
*   **Don't use Material 2 "Drop Shadows":** They look dated and heavy. Use tonal elevation.
*   **Don't crowd the display:** If a user has one countdown, let it fill the screen. Avoid the temptation to show a "list" view by default if a "hero" view is more impactful.
*   **Don't use sharp corners:** Even "small" components must adhere to the `sm` (0.5rem) or `DEFAULT` (1rem) roundedness to maintain the "soothing" brand promise.