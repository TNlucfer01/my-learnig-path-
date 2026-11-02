import os

from pathlib import Path

from dotenv import load_dotenv

load_dotenv()


BASE_DIR = Path(__file__).resolve().parent.parent


SECRET_KEY = os.environ.get("DJANGO_SECRET_KEY", "django-insecure-change-me")

DEBUG = os.environ.get("DEBUG", "False") == "True"

ALLOWED_HOSTS = os.environ.get("ALLOWED_HOSTS", "*").split(",")


# --- INSTALLED APPS ---

# Add or remove apps here depending on which modules you use

INSTALLED_APPS = [
    "jazzmin",  # Admin UI — must be FIRST
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    "cloudinary_storage",  # Must be before cloudinary
    "cloudinary",
    # --- Your apps go here ---
    "core",
    "accounts",
    "products",
    "cart",
    "orders",
    "reviews",
    "tailwind",
    "theme",
]


MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "whitenoise.middleware.WhiteNoiseMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
]


ROOT_URLCONF = "tes.urls"


TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [BASE_DIR / "templates"],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
                "cart.cart.cart_context",  # Injects cart into every template
                "tes.context_processors.theme_colors",
                "core.context_processors.contact_info",
            ],
        },
    }
]


WSGI_APPLICATION = "tes.wsgi.application"


# --- DATABASE ---

import dj_database_url

DATABASE_URL = os.environ.get("DATABASE_URL")

if DATABASE_URL:

    DATABASES = {
        "default": dj_database_url.config(
            default=DATABASE_URL,
            conn_max_age=600,
            conn_health_checks=True,
        )
    }

else:

    DATABASES = {
        "default": {
            "ENGINE": "django.db.backends.sqlite3",
            "NAME": BASE_DIR / "db.sqlite3",
        }
    }


# --- SESSIONS (cookie-based, no DB needed) ---

SESSION_ENGINE = "django.contrib.sessions.backends.signed_cookies"

SESSION_COOKIE_HTTPONLY = True

SESSION_COOKIE_SECURE = not DEBUG

SESSION_COOKIE_SAMESITE = "Lax"


# --- STATIC FILES ---

STATIC_URL = "static/"

STATIC_ROOT = BASE_DIR / "staticfiles"

STATICFILES_DIRS = [BASE_DIR / "static"]


# --- MEDIA FILES (Cloudinary) ---

MEDIA_URL = "/media/"

MEDIA_ROOT = BASE_DIR / "media"


STORAGES = {
    "default": {
        "BACKEND": "cloudinary_storage.storage.MediaCloudinaryStorage",
    },
    "staticfiles": {
        "BACKEND": (
            "whitenoise.storage.CompressedStaticFilesStorage"
            if not DEBUG
            else "django.contrib.staticfiles.storage.StaticFilesStorage"
        ),
    },
}


# --- CUSTOM SETTINGS ---

CART_SESSION_ID = "cart"

UPI_ID = os.environ.get("UPI_ID", "yourname@upi")

PAYEE_NAME = os.environ.get("PAYEE_NAME", "Your Store")

GOOGLE_SCRIPT_URL = os.environ.get("GOOGLE_SCRIPT_URL", "")


TAILWIND_APP_NAME = "theme"

INTERNAL_IPS = ["127.0.0.1"]


DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"


AUTH_PASSWORD_VALIDATORS = [
    {
        "NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator"
    },
    {"NAME": "django.contrib.auth.password_validation.MinimumLengthValidator"},
    {"NAME": "django.contrib.auth.password_validation.CommonPasswordValidator"},
    {"NAME": "django.contrib.auth.password_validation.NumericPasswordValidator"},
]


LANGUAGE_CODE = "en-us"

TIME_ZONE = "UTC"

USE_I18N = True

USE_TZ = True


LOGIN_URL = "/accounts/login/"

LOGIN_REDIRECT_URL = "/"


# --- SITE CONTACT INFO (used in footer/contact page) ---

SITE_CONTACT = {
    "phone": os.environ.get("CONTACT_PHONE", "+91 00000 00000"),
    "email": os.environ.get("CONTACT_EMAIL", "you@email.com"),
    "address": os.environ.get("CONTACT_ADDRESS", "Your City, India"),
    "working_hours": os.environ.get("CONTACT_HOURS", "Mon–Sat: 9 AM – 6 PM"),
    "whatsapp_url": os.environ.get("CONTACT_WHATSAPP_URL", "https://wa.me/"),
    "instagram_url": os.environ.get("CONTACT_INSTAGRAM_URL", "https://instagram.com/"),
}


# --- JAZZMIN ADMIN UI ---

JAZZMIN_SETTINGS = {
    "site_title": "My Store Admin",
    "site_header": "My Store",
    "site_brand": "My Store",
    "welcome_sign": "Welcome to My Store Management",
    "copyright": "My Store Ltd",
    "search_model": ["auth.User", "products.Product"],
    "show_sidebar": True,
    "navigation_expanded": True,
    "order_with_respect_to": ["auth", "products", "orders", "cart"],
    "icons": {
        "auth": "fas fa-users-cog",
        "auth.user": "fas fa-user",
        "products.Product": "fas fa-box",
        "products.Category": "fas fa-tags",
        "orders.Order": "fas fa-shopping-cart",
    },
    "changeform_format": "horizontal_tabs",
}


JAZZMIN_UI_TWEAKS = {
    "theme": "pulse",  # Change this to any Bootswatch theme name
    "brand_colour": "navbar-primary",
    "sidebar": "sidebar-dark-primary",
    "navbar": "navbar-dark",
}
