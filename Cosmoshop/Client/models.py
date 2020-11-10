from django.db import models

# Create your models here.


# Table - 1
class Skin_Survey(models.Model):
     skin_survey_id = models.CharField(max_length=20,primary_key=True)
     picture = models.ImageField(upload_to='survey_images',null=True)


# Table - 2
class Role(models.Model):
    role_id = models.CharField(max_length=20,primary_key=True)
    role_type = models.CharField(max_length=20,null=True)
    is_delete = models.IntegerField(default=0)
    is_active = models.IntegerField(default=1)


    class Meta:
        db_table = "Role"


# Table - 3
class Admin(models.Model):
    admin_id = models.CharField(max_length=20,primary_key=True)
    name = models.CharField(max_length=20,null=True)
    email_id = models.EmailField(null=True)
    password = models.CharField(max_length=20,default='',null=True)
    contact_no = models.BigIntegerField(null=True)
    role_id = models.ForeignKey(Role, default=1,on_delete=models.DO_NOTHING)
    is_delete = models.IntegerField(default=0)
    is_active = models.IntegerField(default=1)

    class Meta:
        db_table = "Admin"

# Table - 4
class State(models.Model):
    state_id = models.CharField(max_length=20,primary_key=True)
    name = models.CharField(max_length=20,null=True)
    is_delete = models.IntegerField(default=0)
    is_active = models.IntegerField(default=1)

    class Meta:
        db_table = "State"

# Table - 5
class City(models.Model):
    city_id = models.CharField(max_length=20,primary_key=True)
    name = models.CharField(max_length=20,null=True)
    state_id = models.ForeignKey(State,default=1,on_delete=models.DO_NOTHING)
    is_delete = models.IntegerField(default=0)
    is_active = models.IntegerField(default=1)

    class Meta:
        db_table = "City"

# Table - 6
class Address(models.Model):
     address_id = models.CharField(max_length=20, primary_key=True)
     address = models.TextField(null=True)
     city_id = models.ForeignKey(City, default=1,on_delete=models.DO_NOTHING)
     Zipcode = models.IntegerField(null=True)
     is_delete = models.IntegerField(default=0)
     is_active = models.IntegerField(default=1)


     class Meta:
          db_table = "Address"


# Table - 7
class Customer(models.Model):
    customer_id = models.CharField(max_length=20,primary_key=True)
    name = models.CharField(max_length=20,null=True)
    email_id = models.EmailField(null=True)
    password = models.CharField(max_length=200,default='',null=True)
    contact_no = models.BigIntegerField(null=True)
    role_id = models.ForeignKey(Role, default=1,on_delete=models.DO_NOTHING)
    address_id = models.ForeignKey(Address, default=1,on_delete=models.DO_NOTHING)
    is_delete = models.IntegerField(default=0)
    is_active = models.IntegerField(default=1)

    class Meta:
        db_table = "Customer"

# Table - 8
class Payment_Type(models.Model):
     payment_type_id = models.CharField(max_length=20, primary_key=True)
     name = models.CharField(max_length=20,null=True)
     is_delete = models.IntegerField(default=0)
     is_active = models.IntegerField(default=1)


     class Meta:
          db_table = "Payment_Type"


# Table - 9
class Supplier(models.Model):
    supplier_id = models.CharField(max_length=20,primary_key=True)
    company_name = models.CharField(max_length=20,null=True)
    contact_no = models.BigIntegerField(null=True)
    email_id = models.EmailField(null=True)
    password = models.CharField(max_length=20, default='',null=True)
    address_id = models.ForeignKey(Address, default=1,on_delete=models.DO_NOTHING)
    partnership_date = models.DateField(null=True)
    latest_supply_date = models.DateField(null=True)
    role_id = models.ForeignKey(Role, default=1,on_delete=models.DO_NOTHING)
    payment_type_id = models.ForeignKey(Payment_Type,on_delete=models.DO_NOTHING)
    is_delete = models.IntegerField(default=0)
    is_active = models.IntegerField(default=1)

    class Meta:
        db_table = "Supplier"


# Table - 10
class Category(models.Model):
     category_id = models.CharField(max_length=20, primary_key=True)
     name = models.CharField(max_length=20,null=True)
     is_delete = models.IntegerField(default=0)
     is_active = models.IntegerField(default=1)


     class Meta:
          db_table = "Category"


# Table - 11
class Sub_Category1(models.Model):
    sub_category1_id = models.CharField(max_length=20, primary_key=True)
    category_id = models.ForeignKey(Category,default=1,on_delete=models.DO_NOTHING)
    name = models.CharField(max_length=20, null=True)
    is_delete = models.IntegerField(default=0)
    is_active = models.IntegerField(default=1)

    class Meta:
        db_table = "Sub_Category1"


# Table - 12
class Sub_Category2(models.Model):
    sub_category2_id = models.CharField(max_length=20, primary_key=True)
    sub_category1_id = models.ForeignKey(Sub_Category1, default=1, on_delete=models.DO_NOTHING)
    name = models.CharField(max_length=20, null=True)
    is_delete = models.IntegerField(default=0)
    is_active = models.IntegerField(default=1)

    class Meta:
        db_table = "Sub_Category2"


# Table - 13
class Product_Color(models.Model):
     product_color_id = models.CharField(max_length=20, primary_key=True)
     shade_name = models.CharField(max_length=20,null=True)
     color_code = models.CharField(max_length=20,null=True)
     is_delete = models.IntegerField(default=0)
     is_active = models.IntegerField(default=1)


     class Meta:
          db_table = "Product_Color"


# Table - 14
class Product_Brand(models.Model):
     product_brand_id = models.CharField(max_length=20, primary_key=True)
     name = models.CharField(max_length=100,null=True)
     is_delete = models.IntegerField(default=0)
     is_active = models.IntegerField(default=1)


     class Meta:
          db_table = "Product_Brand"


# Table - 15
class Product(models.Model):
     product_id = models.CharField(max_length=20, primary_key=True)
     sub_category2_id = models.ForeignKey(Sub_Category2, default=1,on_delete=models.DO_NOTHING)
     supplier_id = models.ForeignKey(Supplier, default=1,on_delete=models.DO_NOTHING)
     color_id =  models.ForeignKey(Product_Color, default=1,on_delete=models.DO_NOTHING)
     brand_id = models.ForeignKey(Product_Brand, default=1,on_delete=models.DO_NOTHING)
     name = models.CharField(max_length=100,null=True)
     description = models.TextField(null=True)
     total_stock = models.IntegerField(null=True)
     current_stock = models.IntegerField(null=True)
     price =  models.FloatField(null=True)
     rating = models.FloatField(null=True)
     product_size = models.CharField(max_length=100,null=True)
     product_image = models.ImageField(upload_to='Products',null=True)
     is_wrinkle_product = models.IntegerField(default=0)
     is_pimple_product = models.IntegerField(default=0)
     skintone = models.CharField(max_length=100,null=True)
     is_delete = models.IntegerField(default=0)
     is_active = models.IntegerField(default=1)


     class Meta:
          db_table = "Product"


# Table - 16
class Customer_Order(models.Model):
     customer_order_id = models.CharField(max_length=20, primary_key=True)
     customer_id = models.ForeignKey(Customer, default=1,on_delete=models.DO_NOTHING)
     address_id = models.ForeignKey(Address, default=1,on_delete=models.DO_NOTHING)
     contact_no = models.BigIntegerField(null=True)
     order_date = models.DateField(null=True)
     order_amount = models.FloatField(null=True)
     productinfo = models.CharField(null=False,max_length=255,default='')
     is_successful = models.IntegerField(null=True)
     is_delete = models.IntegerField(default=0)
     is_active = models.IntegerField(default=1)
     status = models.CharField(max_length=255,null=True)


     class Meta:
          db_table = "Customer_Order"


# Table - 17
class Payment(models.Model):
     payment_id = models.CharField(max_length=20, primary_key=True)
     customer_order_id = models.ForeignKey(Customer_Order, default=1,on_delete=models.DO_NOTHING)
     is_successful = models.IntegerField(null=True)
     is_delete = models.IntegerField(default=0)
     is_active = models.IntegerField(default=1)

     class Meta:
          db_table = "Payment"


# Table - 18
class Review(models.Model):
     review_id = models.CharField(max_length=20, primary_key=True)
     customer_id = models.ForeignKey(Customer, default=1,on_delete=models.DO_NOTHING)
     product_id = models.ForeignKey(Product, default=1,on_delete=models.DO_NOTHING)
     review_message = models.TextField(null=True)
     is_delete = models.IntegerField(default=0)
     is_active = models.IntegerField(default=1)


     class Meta:
          db_table = "Review"


# Table - 19
class Coupon(models.Model):
     coupon_id = models.CharField(max_length=20, primary_key=True)
     coupon_code = models.CharField(max_length=20,null=True)
     activation_date = models.DateField(null=True)
     expiry_date = models.DateField(null=True)
     is_delete = models.IntegerField(default=0)
     is_active = models.IntegerField(default=1)


     class Meta:
          db_table = "Coupon"


# Table - 20
class Contact_us(models.Model):
    contact_id = models.CharField(max_length=20, primary_key=True)
    name = models.CharField(max_length=20, null=True)
    email_id = models.EmailField(null=True)
    contact_no = models.BigIntegerField(null=True)
    message = models.TextField(null=True)
    is_delete = models.IntegerField(default=0)
    is_active = models.IntegerField(default=1)

    class Meta:
        db_table = "Contact_us"

# Table - 21
class Newsletter(models.Model):
    newsletter_id = models.CharField(max_length=20, primary_key=True)
    email_id = models.EmailField(null=True)
    is_delete = models.IntegerField(default=0)
    is_active = models.IntegerField(default=1)

    class Meta:
        db_table = "Newsletter"

# Table - 22
class Blogpost(models.Model):
    post_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=500,default="")
    head0 = models.CharField(max_length=1000, default="")
    chead0 = models.CharField(max_length=1000, default="")
    head1 = models.CharField(max_length=1000, default="")
    chead1 = models.CharField(max_length=1000, default="")
    head2 = models.CharField(max_length=1000, default="")
    chead2 = models.CharField(max_length=1000, default="")
    pub_date = models.DateField()
    author = models.CharField(max_length=1000, default="")
    is_delete = models.IntegerField(default=0, null=True)
    is_active = models.IntegerField(default=1, null = True)
    thumbnail = models.ImageField(upload_to='upload/images', default="")
    topic = models.CharField(max_length=100,default="")

    class Meta:
        db_table = "Blogpost"

