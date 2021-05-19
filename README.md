# ModularizedAppTemplate

A template for a modularized, multi-brand iOS app. Useful for spiking problems against a more complex Xcode workspace.

Dependency graph:
- App
    - Module1
        - Core
    - Module2
        - Core
    - Core
    
Patterns explored in this template:
- Branding
- Sharing assets across a modularized app
- Sharing localized strings across a modularized app
- Routing (TODO - VCs in experience modules shouldn't be public)
