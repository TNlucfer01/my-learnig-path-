# Tailwind CSS Cheat Sheet

## Typography
- text-xs: Sets font size to extra small (~12px).
- text-sm: Sets font size to small (~14px).
- text-base: Sets font size to base (~16px).
- text-lg: Sets font size to large (~18px).
- text-xl: Sets font size to extra large (~20px).
- text-2xl: Sets font size to 2x large (~24px).
- text-3xl: Sets font size to 3x large (~30px).
- font-bold: Sets font weight to bold.
- font-semibold: Sets font weight to semi-bold.
- font-normal: Sets font weight to normal.
- italic: Applies italic font style.
- not-italic: Removes italic font style.
- text-left: Aligns text to the left.
- text-center: Aligns text to the center.
- text-right: Aligns text to the right.
- text-justify: Justifies text.
- text-[color]: Sets text color (e.g., text-red-500, text-blue-700).
- leading-none: Sets line height to none (~1).
- leading-tight: Sets tight line height (~1.25).
- leading-normal: Sets normal line height (~1.5).
- tracking-tight: Sets tight letter spacing (~-0.025em).
- tracking-normal: Sets normal letter spacing (~0em).
- tracking-wide: Sets wide letter spacing (~0.025em).
- underline: Applies text underline.
- line-through: Applies strikethrough text.
- no-underline: Removes text underline.

## Layout
- container: Centers content with max-width based on screen size.
- mx-auto: Centers element horizontally using auto margins.
- block: Sets display to block.
- inline-block: Sets display to inline-block.
- inline: Sets display to inline.
- flex: Sets display to flex.
- inline-flex: Sets display to inline-flex.
- grid: Sets display to grid.
- hidden: Hides element (display: none).
- visible: Makes element visible.
- w-[size]: Sets width (e.g., w-4 for 1rem, w-full for 100%).
- h-[size]: Sets height (e.g., h-4 for 1rem, h-full for 100%).
- max-w-[size]: Sets maximum width (e.g., max-w-sm, max-w-4xl).
- max-h-[size]: Sets maximum height (e.g., max-h-64).
- min-w-[size]: Sets minimum width (e.g., min-w-0, min-w-full).
- min-h-[size]: Sets minimum height (e.g., min-h-0, min-h-full).

## Spacing
- m-[size]: Sets margin on all sides (e.g., m-4 for 1rem).
- mx-[size]: Sets horizontal margin (e.g., mx-4).
- my-[size]: Sets vertical margin (e.g., my-4).
- mt-[size]: Sets top margin (e.g., mt-4).
- mr-[size]: Sets right margin (e.g., mr-4).
- mb-[size]: Sets bottom margin (e.g., mb-4).
- ml-[size]: Sets left margin (e.g., ml-4).
- p-[size]: Sets padding on all sides (e.g., p-4 for 1rem).
- px-[size]: Sets horizontal padding (e.g., px-4).
- py-[size]: Sets vertical padding (e.g., py-4).
- pt-[size]: Sets top padding (e.g., pt-4).
- pr-[size]: Sets right padding (e.g., pr-4).
- pb-[size]: Sets bottom padding (e.g., pb-4).
- pl-[size]: Sets left padding (e.g., pl-4).
- space-x-[size]: Sets horizontal spacing between children (e.g., space-x-4).
- space-y-[size]: Sets vertical spacing between children (e.g., space-y-4).

## Flexbox
- flex-row: Sets flex direction to row.
- flex-col: Sets flex direction to column.
- flex-wrap: Allows flex items to wrap.
- flex-nowrap: Prevents flex items from wrapping.
- flex-1: Sets flex to 1 (flex: 1 1 0%).
- flex-auto: Sets flex to auto (flex: 1 1 auto).
- flex-none: Disables flex shrinking and growing.
- justify-start: Aligns flex items to start.
- justify-center: Centers flex items.
- justify-end: Aligns flex items to end.
- justify-between: Spreads flex items with space between.
- justify-around: Spreads flex items with space around.
- items-start: Aligns flex items to start (cross-axis).
- items-center: Centers flex items (cross-axis).
- items-end: Aligns flex items to end (cross-axis).
- items-stretch: Stretches flex items to fill cross-axis.

## Grid
- grid-cols-[n]: Sets number of grid columns (e.g., grid-cols-3).
- grid-rows-[n]: Sets number of grid rows (e.g., grid-rows-2).
- gap-[size]: Sets gap between grid items (e.g., gap-4).
- col-span-[n]: Sets column span (e.g., col-span-2).
- row-span-[n]: Sets row span (e.g., row-span-2).
- col-start-[n]: Sets column start position (e.g., col-start-1).
- col-end-[n]: Sets column end position (e.g., col-end-3).
- row-start-[n]: Sets row start position (e.g., row-start-1).
- row-end-[n]: Sets row end position (e.g., row-end-3).
- auto-cols-[size]: Sets auto column size (e.g., auto-cols-min).
- auto-rows-[size]: Sets auto row size (e.g., auto-rows-min).

## Backgrounds
- bg-[color]: Sets background color (e.g., bg-blue-500).
- bg-opacity-[value]: Sets background opacity (e.g., bg-opacity-50 for 50%).
- bg-gradient-to-[dir]: Applies gradient in direction (e.g., bg-gradient-to-r).
- from-[color]: Sets gradient start color (e.g., from-red-500).
- via-[color]: Sets gradient middle color (e.g., via-yellow-500).
- to-[color]: Sets gradient end color (e.g., to-green-500).
- bg-cover: Scales background image to cover element.
- bg-contain: Scales background image to fit within element.
- bg-center: Centers background image.
- bg-no-repeat: Prevents background image repetition.

## Borders
- border: Adds default border (1px solid).
- border-[size]: Sets border width (e.g., border-2 for 2px).
- border-[color]: Sets border color (e.g., border-gray-500).
- border-t: Adds top border.
- border-r: Adds right border.
- border-b: Adds bottom border.
- border-l: Adds left border.
- rounded: Applies default border radius (~0.25rem).
- rounded-[size]: Sets border radius (e.g., rounded-md, rounded-full).
- border-solid: Sets solid border style.
- border-dashed: Sets dashed border style.
- border-dotted: Sets dotted border style.

## Colors
- [color]-[shade]: Applies color with shade (e.g., text-red-500, bg-blue-700).
- Colors: red, blue, green, yellow, indigo, purple, pink, gray, etc.
- Shades: 50, 100, 200, ..., 900 (light to dark).
- opacity-[value]: Sets color opacity (e.g., text-opacity-50 for 50%).

## Positioning
- relative: Sets position to relative.
- absolute: Sets position to absolute.
- fixed: Sets position to fixed.
- sticky: Sets position to sticky.
- top-[size]: Sets top offset (e.g., top-4).
- right-[size]: Sets right offset (e.g., right-4).
- bottom-[size]: Sets bottom offset (e.g., bottom-4).
- left-[size]: Sets left offset (e.g., left-4).
- z-[value]: Sets z-index (e.g., z-10, z-50).

## Shadows
- shadow: Applies default shadow.
- shadow-[size]: Sets shadow size (e.g., shadow-md, shadow-xl).
- shadow-inner: Applies inner shadow.
- shadow-none: Removes shadow.

## Transitions and Animations
- transition: Enables smooth transitions for all properties.
- transition-[property]: Transitions specific property (e.g., transition-colors).
- duration-[ms]: Sets transition duration (e.g., duration-300 for 300ms).
- ease-[type]: Sets easing function (e.g., ease-in, ease-out).
- animate-[name]: Applies animation (e.g., animate-spin, animate-pulse).
- animate-none: Disables animation.

## Transforms
- transform: Enables transform utilities.
- scale-[value]: Scales element (e.g., scale-75 for 75%, scale-125 for 125%).
- rotate-[deg]: Rotates element (e.g., rotate-45 for 45deg).
- translate-x-[size]: Translates horizontally (e.g., translate-x-4).
- translate-y-[size]: Translates vertically (e.g., translate-y-4).
- skew-x-[deg]: Skews element horizontally (e.g., skew-x-12).
- skew-y-[deg]: Skews element vertically (e.g., skew-y-12).

## Interactivity
- cursor-pointer: Sets cursor to pointer.
- cursor-not-allowed: Sets cursor to not-allowed.
- pointer-events-none: Disables pointer events.
- pointer-events-auto: Enables pointer events.
- select-none: Disables text selection.
- select-text: Enables text selection.
- select-all: Selects all text on focus.

## Responsive Design
- sm:[utility]: Applies utility at small breakpoint (~640px, e.g., sm:text-lg).
- md:[utility]: Applies utility at medium breakpoint (~768px, e.g., md:flex).
- lg:[utility]: Applies utility at large breakpoint (~1024px, e.g., lg:grid-cols-3).
- xl:[utility]: Applies utility at extra-large breakpoint (~1280px).
- 2xl:[utility]: Applies utility at 2x-large breakpoint (~1536px).

## Pseudo-Classes
- hover:[utility]: Applies utility on hover (e.g., hover:bg-blue-700).
- focus:[utility]: Applies utility on focus (e.g., focus:ring-2).
- active:[utility]: Applies utility when active (e.g., active:bg-gray-900).
- disabled:[utility]: Applies utility when disabled (e.g., disabled:opacity-50).
- first:[utility]: Applies utility to first child (e.g., first:ml-0).
- last:[utility]: Applies utility to last child (e.g., last:mr-0).
- odd:[utility]: Applies utility to odd children (e.g., odd:bg-gray-100).
- even:[utility]: Applies utility to even children (e.g., even:bg-white).

## Pseudo-Elements
- before:[utility]: Applies utility to ::before pseudo-element.
- after:[utility]: Applies utility to ::after pseudo-element.
- content-['text']: Sets content for pseudo-elements (e.g., content-['*']).

## Advanced Utilities
- ring: Adds default focus ring.
- ring-[size]: Sets focus ring width (e.g., ring-2).
- ring-[color]: Sets focus ring color (e.g., ring-blue-500).
- ring-opacity-[value]: Sets ring opacity (e.g., ring-opacity-50).
- divide-x-[size]: Adds horizontal divider between children (e.g., divide-x-2).
- divide-y-[size]: Adds vertical divider between children (e.g., divide-y-2).
- divide-[color]: Sets divider color (e.g., divide-gray-300).
- space-x-reverse: Reverses horizontal spacing direction.
- space-y-reverse: Reverses vertical spacing direction.
- aspect-[ratio]: Sets aspect ratio (e.g., aspect-square, aspect-video).
- columns-[n]: Sets column count for multi-column layout (e.g., columns-2).
- break-before-[value]: Controls column/page breaks (e.g., break-before-column).
- break-after-[value]: Controls column/page breaks (e.g., break-after-column).
- object-[fit]: Sets object fit (e.g., object-cover, object-contain).
- object-[position]: Sets object position (e.g., object-center, object-top).
- overflow-[value]: Sets overflow behavior (e.g., overflow-auto, overflow-hidden).
- overscroll-[value]: Sets overscroll behavior (e.g., overscroll-contain).
- sr-only: Hides element visually but keeps it accessible to screen readers.
- not-sr-only: Makes element visible and accessible.

## Custom Values
- [utility]:[value]: Applies custom value (e.g., w-[200px], text-[20px]).
- text-[arbitrary]: Sets arbitrary font size (e.g., text-[2.5rem]).
- bg-[arbitrary]: Sets arbitrary background (e.g., bg-[#123456]).
- m-[arbitrary]: Sets arbitrary margin (e.g., m-[10px]).
- p-[arbitrary]: Sets arbitrary padding (e.g., p-[1.5rem]).

## Notes
- Combine utilities for complex styles (e.g., `flex justify-center items-center`).
- Use arbitrary values for custom styling (e.g., `w-[50%]`, `bg-[#123456]`).
- Refer to Tailwind CSS documentation for breakpoint values and customization.
