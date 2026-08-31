├── assets/data/lookup\_rules.json



lib/
├── main.dart                   # Entry point (Initializes feature context \& app shell)
├── app/
│   ├── app.dart                # MaterialApp configuration with dynamic routing
│   ├── theme.dart              # LoopIon design system \& colors
│   └── routes.dart             # Dynamic route guard engine; prevents navigation to unpurchased features
│
├── config/
│   ├── features\_config.dart    # Registry mapping feature keys to UI titles, icons, and route strings
│   └── roles\_config.dart       # Default feature permission sets mapped to user roles (OEM, Recycler, Fleet)
│
├── core/                       # Shared platform-level infrastructure
│   ├── network/
│   │   └── api\_client.dart     # HTTP client (Dio/http); injects JWT auth tokens, base URLs, \& handles errors
│   │
│   ├── providers/
│   │   ├── auth\_provider.dart  # Manages user session state, login/logout, and JWT token persistence
│   │   └── feature\_provider.dart # Holds array of backend-enabled features; notifies UI widgets to re-render
│   │
│   └── widgets/
│       ├── custom\_button.dart  # Shared reusable UI button component
│       ├── file\_picker.dart   # Shared utility widget for picking sales CSVs and credit receipts
│       └── dynamic\_drawer.dart # Sidebar menu that dynamically filters items based on FeatureProvider
|       └──app\_shell    #app\_shell is the reusable outer container for app screens, not the business logic itself.
│
├── services/                   # App-wide global API services
│   ├── auth\_service.dart       # Communicates with /auth endpoints for login verification
│   └── tenant\_service.dart     # Calls /tenant/config to fetch active features purchased by the client
│
├── modules/                    # Modular, self-contained business domain features
│   │
│   ├── cpcb/                   # CPCB EPR Compliance Module
│   │   ├── screens/
│   │   │   ├── cpcb\_dashboard\_screen.dart # Main view displaying EPR obligation progress bars and target gaps
│   │   │   └── form3\_export\_screen.dart   # Screen to preview and download generated CPCB Form 3 filings
│   │   ├── widgets/
│   │   │   ├── target\_progress\_bar.dart   # Widget showing progress toward annual recycling targets
│   │   │   └── sales\_csv\_uploader.dart    # CSV drop-zone widget for importing battery sales batches
│   │   ├── bloc/               # State management (CPCBBloc, Events, States) for CPCB calculations
│   │   ├── models/
│   │   │   └── cpcb\_target\_model.dart     # Data structure for battery chemistries, weights, and obligations
│   │   └── services/
│   │       └── cpcb\_service.dart          # Makes API requests to save sales data and calculate CPCB obligations
│   │
│   ├── marketplace/            # EPR Credit Marketplace Module
│   │   ├── screens/
│   │   │   └── credit\_marketplace\_screen.dart # Browse available EPR recycling credits from recyclers
│   │   ├── widgets/
│   │   │   ├── credit\_listing\_card.dart   # UI card displaying credit volume, chemistry, and price
│   │   │   └── buy\_credit\_modal.dart      # Dialog modal to execute credit transfer requests
│   │   ├── bloc/               # State management for fetching and purchasing marketplace listings
│   │   ├── models/
│   │   │   └── credit\_order\_model.dart    # Data structure for credit transactions and certificates
│   │   └── services/
│   │       └── marketplace\_service.dart   # Fetches credit listings and posts buyer order requests to backend
│   │
│   ├── warranty/               # Warranty Claims \& Validation Module
│   │   ├── screens/
│   │   │   └── warranty\_claims\_screen.dart   # Table view of active, approved, and flagged warranty claims
│   │   ├── widgets/
│   │   │   ├── claim\_filing\_form.dart        # Form UI to submit a new battery failure report
│   │   │   └── validation\_badge.dart         # Status badge indicating if BMS telematics validates the claim
│   │   ├── bloc/               # State management handling warranty verification logic
│   │   ├── models/
│   │   │   └── warranty\_claim\_model.dart     # Data model for claim history and defect diagnostic logs
│   │   └── services/
│   │       └── warranty\_service.dart         # Sends warranty claim payloads to backend for auto-validation
│   │
│   ├── bpan/                   # Battery Pack Allocation Number (BPAN) Module
│   │   ├── screens/
│   │   │   └── bpan\_generator\_screen.dart    # Batch generation interface for battery serial IDs and QR codes
│   │   ├── widgets/
│   │   │   ├── bpan\_batch\_form.dart          # Form for entering factory lot numbers and cell quantities
│   │   │   └── qr\_print\_preview.dart         # Printable preview layout for industrial QR label printers
│   │   ├── bloc/               # State management for generating unique serial numbers
│   │   ├── models/
│   │   │   └── bpan\_serial\_model.dart        # Data model mapping BPAN ID to chemistry and pack metadata
│   │   └── services/
│   │       └── bpan\_service.dart             # Posts pack batches to backend and returns generated BPAN IDs
│   │
│   ├── bpan\_scanner/           # Web/Mobile Camera Scanner Module
│   │   ├── screens/
│   │   │   └── bpan\_scanner\_screen.dart      # Viewport screen integrating the device camera for QR scanning
│   │   ├── widgets/
│   │   │   └── camera\_overlay.dart           # Framing overlay UI displayed over the camera viewfinder
│   │   └── services/
│   │       └── scanner\_service.dart          # Decodes scanned QR payload and retrieves pack history from backend
│   │
│   └── telematics/             # BMS Thermal Analytics \& Heatmap Module
│       ├── screens/
│       │   └── telematics\_heatmap\_screen.dart # Visual dashboard for fleet health and battery cell thermal maps
│       ├── widgets/
│       │   ├── thermal\_grid\_heatmap.dart      # Color-coded grid rendering live cell temperature distributions
│       │   └── soh\_line\_chart.dart            # Historical State-of-Health (SoH) degradation trend chart
│       ├── bloc/               # State management handling WebSocket streaming for BMS sensor data
│       ├── models/
│       │   └── telematics\_frame\_model.dart   # Data model for voltage, current, and temperature telemetry frames
│       └── services/
│           └── telematics\_service.dart        # Connects to backend WebSockets/REST APIs for real-time telemetry streams
│
└── utils/
├── bpan\_parser.dart        # Helper for parsing, string-splitting, and validating scanned BPAN strings
└── pdf\_saver.dart          # Utility to convert output data into PDF format on mobile and web devices



