# 🌟 QuickPanel v2 PRO — Premium SMM Reseller Platform 🌟

**QuickPanel v2 PRO** is an industry-leading, highly responsive, and feature-complete **Social Media Marketing (SMM) Panel** platform. Built on a powerful, secure, and lightweight PHP & Twig architecture, it provides an all-in-one solution for SMM service providers, resellers, and agency owners to automate orders, integrate with api providers, and deliver exceptional social media marketing services globally.

---

## 🚀 Key Features Overview

*   🎨 **Premium Multi-Theme Engine** — Comes pre-loaded with four modern, high-fidelity responsive themes (`Simplify`, `Eternity`, `Pitchy`, and `Xblur`) configured for ultimate user conversion.
*   🔄 **Full API Automation** — Seamlessly import services, sync descriptions, sync pricing margins, and automatically forward orders directly to third-party SMM providers.
*   💳 **Integrated Global Payments** — Native support for Stripe, Mollie, 2Checkout, bank transfers, and manual payment verification options.
*   📈 **Drip-Feed & Automated Subscriptions** — Enable clients to automate recurring post likes/views or drip their engagement slowly over days/weeks.
*   👥 **Complete Admin Control & CMS** — Manage clients, support tickets, custom branding, SEO settings, dynamic landing pages, system translations, coupons, and referral campaigns in one elegant admin dashboard.

---

## 🛠️ Complete Tech Stack

This platform leverages modern, secure, and production-tested technologies optimized for high-performance and absolute scalability:

*   **Backend Core:** 🐘 PHP 7.4.x — Standard Object-Oriented MVC codebase powered by robust data structures and highly secure coding patterns.
*   **Database Engine:** 🗄️ MySQL & PDO — Uses PHP Data Objects (PDO) with prepared statements to secure the platform against SQL injection attacks.
*   **Template Engine:** 🎨 Twig Template Engine v2.0 — High-performance, clean template parsing for maximum separation of concerns (HTML view vs backend logic) ensuring lightweight page render speeds.
*   **Authentication & Security:** 🔐 Multi-Factor Authentication (Google 2FA Integration via `pragmarx/google2fa` & `bacon/bacon-qr-code`), secure hashing algorithms, and cookie/session validators.
*   **Email Dispatch Engine:** ✉️ PHPMailer v6.7 — Handles secure SMTP mail delivery for client signups, password resets, ticket notifications, and payment alerts.
*   **Third-Party & API Integrations:** 
    *   OAuth2 Social Login (`google/apiclient`)
    *   Stripe Payments (`stripe/stripe-php`)
    *   Mollie Payment Gateway (`mollie/mollie-api-php`)
    *   2Checkout Global Payments (`xfoxawy/2checkout`)
*   **Dependency Manager:** 📦 Composer

---

## 👤 Comprehensive Feature List: Client & User Dashboard

The client area provides a seamless, intuitive UX designed to turn visitors into repeat SMM service resellers and buyers:

-   📊 **Dynamic Dashboard Panel:**
    -   Personalized dashboard header with real-time greetings.
    -   Live account balance, spent amount statistics, and total order counters.
    -   Quick navigation widgets to quickly create orders or request support.
-   🛒 **Ordering Center:**
    -   **New Order Page:** Intuitive drop-downs filtering services dynamically based on selected categories. Displays prices, service descriptions, average completion speed, min/max limits, and automatic total cost calculation as quantity is typed.
    -   **Mass Order Page:** Instantly submit thousands of orders at once using the bulk format `service_id | link | quantity`.
-   ⚡ **Automated Campaigns & Recurrings:**
    -   **Drip-Feed Orders:** Automate service delivery by setting runs and interval frequencies (e.g., deliver 100 followers every 2 hours).
    -   **Auto-Subscriptions:** Set up ongoing likes, views, or comments for any new social media post automatically without lifting a finger.
-   📜 **Interactive Services Directory:**
    -   Searchable and categorized catalog of all available social media services.
    -   Detailed columns showcasing service IDs, pricing per 1,000, description overlays, and min/max delivery thresholds.
-   💳 **Payment & Add-Funds System:**
    -   Multiple pre-configured automated gateway checkouts.
    -   Bank Transfer upload forms allowing users to submit deposit proof.
    -   Transparent transaction statement history log.
-   🎟️ **Integrated Ticket Support:**
    -   Open support tickets with custom categories (Order, Payment, Service, API, Other).
    -   Clean messaging thread to chat directly with administrators.
-   🤝 **Affiliate & Referral Engine:**
    -   Unique invite link generation.
    -   Custom commission statistics (total clicks, registrations, pending payouts, earned commissions).
    -   Easy commission-to-balance transfer requests.
-   🎁 **Coupons & Rewards System:**
    -   Instant coupon code redeemer for promotional discounts or cash bonuses added directly to account balance.
-   📡 **Developer API Access:**
    -   Generate unique API keys.
    -   Fully-documented endpoint specification page outlining how resellers can query services, place orders, check status, and request balance info programmatically.
-   📢 **System Log Updates:**
    -   Public logs detailing service additions, custom price drops, price increases, and temporary disables.
-   🔐 **Advanced Profile & Security:**
    -   Change account password, change active currency preference, or toggle Google 2FA (Two-Factor Authentication) security with a simple QR code scan.

---

## 👑 Comprehensive Feature List: Administrator Control Panel

The ultimate power center of the platform. Administrators can manage the entire operations, billing, users, aesthetics, and configurations:

-   📈 **Analytical Dashboard & Business Reports:**
    -   Visual graphs showcasing daily, weekly, and monthly growth.
    -   Key metric cards: Total Revenue, Core Profits, Client Count, Orders Processed, Active Support Tickets.
-   👥 **Client Profile Management:**
    -   Full roster of registered clients with quick search, suspension status, and user registration dates.
    -   Manually credit/debit balances, change passwords, change email verification status, and ban users.
    -   **Special Pricing Module:** Set custom individual pricing adjustments for specific clients on any service.
-   📂 **Services & Catalog Configurator:**
    -   Add, edit, delete, or sort categories using a modern drag-and-drop hierarchy.
    -   Manage individual services, set min/max order limits, write descriptions, and define profit markup rules.
-   🔄 **API Provider Integrations:**
    -   Direct connections to upstream SMM Panels using their API URLs and API keys.
    -   **Smart Sync Scheduler:** Automatically import services, sync prices, sync active/disabled statuses, and auto-forward orders.
    -   Detailed provider activity and sync logs tracking price shifts and connectivity.
-   📦 **Global Order Management:**
    -   Filter all orders by status: *Pending, In Progress, Processing, Completed, Partial, Canceled, Refilling*.
    -   Bulk status updates, full/partial manual refunds, provider forwarding status tracking, and order refilling triggers.
-   💵 **Financial & Bank Verification Hub:**
    -   Accept or decline submitted bank transfer proofs.
    -   Transaction audit logs for credit card, mollie, 2checkout, and manual deposits.
    -   Affiliate commission payouts management dashboard.
-   🎟️ **Tickets & Support Operations:**
    -   A centralized inbox to respond to and manage active customer support issues.
    -   Pre-defined canned templates for fast customer interaction.
-   📢 **Global Broadcast System:**
    -   Schedule and deploy notice headers, warning boxes, or maintenance banners on client dashboards.
-   🌐 **Appearance Suite & CMS:**
    -   🎨 **Theme Selector:** Toggle dashboard styles between pre-installed modern templates (`Simplify`, `Eternity`, `Pitchy`, `Xblur`).
    -   🌍 **Multilingual Engine:** Add new languages, customize active vocabulary translations, and toggle default frontend languages instantly without editing source code files.
    -   📄 **Custom Pages Editor:** Create SEO-friendly custom static pages using a rich WYSIWYG editor.
    -   ✍️ **Blog Manager:** Write, update, and publish blog articles to maximize organic search engine optimization (SEO) traffic.
    -   🔗 **Menu Builder:** Edit frontend links, header tabs, and footer widgets.
    -   🔍 **SEO Meta Tags Config:** Define meta-titles, description meta tags, and indexing configurations per-page or globally.
    -   🛠️ **Integrations Manager:** Quickly paste external scripts (Google Analytics, FB Pixel, Tawk.to chat, smart banners).
-   ⚙️ **System Settings Configuration:**
    -   General settings: site title, logo, favicon, maintenance mode switch, default timezone.
    -   Active payment options toggle, automatic currency exchange rates manager, active dashboard module toggle, and secure SMTP mail configuration.

---

## 📂 System Directory Structure

```text
QUickPanelv2-PRO/
├── admin/                     # Administrator core module
│   ├── controller/            # Admin backend request handlers
│   └── views/                 # PHP-based Admin interface panels & settings CMS
├── app/                       # Application core module
│   ├── classes/               # PHP class declarations, utilities & authentication helpers
│   ├── controller/            # Front-facing controllers (Dashboard, Orders, APIs, Auth)
│   ├── helper/                # Core operations helper scripts and data logic
│   ├── views/                 # Twig template files grouped by pre-installed theme directories
│   │   ├── Eternity/          # Eternity visual UI theme templates
│   │   ├── Simplify/          # Simplify visual UI theme templates
│   │   ├── pitchy/            # Pitchy visual UI theme templates
│   │   └── xblur/             # Xblur visual UI theme templates
│   └── init.php               # Core initialisation script (PDO, Sessions, Twig setup)
├── assets/                    # Public assets (compiled CSS, JS, theme libraries, icons, images)
├── crons/                     # Automated cron scripts (order delivery, API price sync, status checking)
├── install/                   # Platform setup and initial database schema installer wizard
├── composer.json              # Dependency configuration
└── index.php                  # Main entry routing script
```

---

## ⚙️ Quick Installation & Setup Guide

### 📋 Prerequisites
*   **Web Server:** Apache (with `.htaccess` and `mod_rewrite` enabled) or Nginx configured for custom index routing.
*   **PHP Environment:** PHP 7.4.x with extensions: `PDO`, `curl`, `json`, `openssl`, `mbstring`, `zip`.
*   **Database:** MySQL (v5.7+ or MariaDB).

### 🚀 Step-by-Step Installation
1.  **Extract Files:** Upload and extract all project files onto your web root directory (e.g. `public_html`).
2.  **Database Creation:** Log in to your hosting control panel (cPanel, DirectAdmin, etc.) and create a new **MySQL Database**, **User**, and grant all permissions.
3.  **Run Installer:** Open your browser and navigate to your domain (`http://yourdomain.com/install`). Follow the screen instructions to input your database credentials and set up the default Administrator credentials.
4.  **Configure Database (Manual fallback):** If needed, you can modify database details in the `app/config.php` file:
    ```php
    return [
        'db' => [
            'host' => 'localhost',
            'name' => 'your_database_name',
            'user' => 'your_database_username',
            'pass' => 'your_database_password',
            'charset' => 'utf8'
        ]
    ];
    ```
5.  **Configure Cron Jobs:** To enable orders forwarding, status synchronization, and drip-feed triggers, set up the following standard Cron Jobs in your hosting panel to run every 1 or 5 minutes:
    *   **Process Orders:** `php /path-to-your-root/crons/orders.php`
    *   **Sync Statuses:** `php /path-to-your-root/crons/status.php`
    *   **Process Drip-Feed:** `php /path-to-your-root/crons/dripfeed.php`
    *   **Provider Sync:** `php /path-to-your-root/crons/providers.php`

---

## 🔒 Security Recommendations
*   Ensure that the `install` folder is **completely deleted** after completing setup.
*   Configure custom SSL certificates (HTTPS) for secure billing checkout and credential management.
*   Update database passwords periodically.
*   Activate Google Two-Factor Authentication (2FA) in the administrator profile to prevent unauthorized logins.

---

## 📜 License & Support
All proprietary design patterns, themes (`Simplify`, `Eternity`, `Pitchy`, `Xblur`), and administrative dashboard core configurations belong to the original copyright owners of **QuickPanel**. For support, issues, or custom feature installations, please reach out to the project administrator or create a ticket in your client dashboard.

---
*Developed with 💖, optimized for social media growth.*
