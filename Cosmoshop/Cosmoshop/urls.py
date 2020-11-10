"""Cosmoshop URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from Client import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.homepage_view),
    path('homepage_view', views.homepage_view),
    path('upload_survey_image', views.upload_survey_image),
    path('catalog/<str:search>/<str:id>',views.catalog),
    path('search_catalog/<str:keyword>',views.search_catalog),
    path('recommended_product_catalog/<str:problem>/<str:skin_color>',views.recommended_product_catalog),
    path('product_details/<str:id>',views.product_details),
    path('cart',views.cart),
    path('wishlist',views.wishlist),
    path('about_us',views.about_us),
    path('contact_us',views.contact_us),
    path('skin_survey',views.skin_survey),
    path('orders/',views.orders),
    path('catalog_sort/<str:search>/<str:id>/<int:sort>',views.catalog_sort),
    path('add_review',views.add_review),
    path('registration',views.registration),
    path('login',views.login),
    path('logout',views.logout),
    path('add_contact_message',views.add_contact_message),
    path('register_newsletter',views.register_newsletter),
    path('order_information/<str:amount>/<str:products>',views.order_information),
    path('order_processing',views.order_processing),
    path('payu_checkout/<str:amount>/<str:products>',views.payu_checkout, name="payu_checkout"),
    path('payu/success', views.payu_success, name="payu_success"),
    path('payu/failure', views.payu_failure, name="payu_failure"),
    path('blog',views.blog),
    path('blog_post',views.blog_post),
    path("blog_post/<int:id>", views.blog_post,name="blogHome"),
] +static(settings.MEDIA_URL, document_root= settings.MEDIA_ROOT)
