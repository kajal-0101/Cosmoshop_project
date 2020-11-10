from django.shortcuts import render

# Create your views here.
import hashlib
from django.http import HttpResponse
from django.shortcuts import render,redirect
from Client.models import Skin_Survey,Customer,City,State,Product_Brand,Category,Sub_Category1,Sub_Category2,Product,Review, Role,Address,Contact_us,Newsletter, Customer_Order,Payment, Blogpost
import cv2
import numpy as np
import os
import glob
from sklearn.cluster import KMeans
from collections import Counter
import imutils
from autocorrect import Speller
from django.db.models import Q
from django.core.mail import send_mail
from django.core import serializers
from datetime import date

def navigation_data():
    brand = Product_Brand.objects.all()
    categories = Category.objects.all()
    sub_category1 = Sub_Category1.objects.all()
    sub_category2 = Sub_Category2.objects.all()
    return {'Product_Brands': brand,'Category':categories,'Sub_Category1':sub_category1,'Sub_Category2':sub_category2}


def homepage_view(request):
    if 'name' in request.session:
        session = "on"
    else:
        session = "off"
    messages = navigation_data()
    messages.update([('session', session)])
    return render(request, 'home.html', messages)

def upload_survey_image(request):
    print("Handling Request..!")
    pimples = 0
    if 'name' in request.session:
        session = "on"
    else:
        session = "off"
    messages = navigation_data()
    messages.update([('session', session)])

    image = request.FILES['surveyimage']
    filename = str(image)
    ext = ['png', 'jpeg', 'jpg', 'jfif', 'tiff']
    try:
        m = filename.split(".")[1]
        if m not in ext:
            messages.update([('FaceError', 'Please Select an Image File..!')])
            return render(request, "home.html", messages)
        else:
            skin_survey = Skin_Survey(picture=image)
            skin_survey.save()
            # creating facecascade
            face_cascade = cv2.CascadeClassifier(
                "C:\\Users\\kajal\\Downloads\\Project\\Cosmoshop\\Client\\static\\resources\\haarcascade_frontalface_default.xml")
            # loading image to matrix
            path = "C:\\Users\\kajal\\Downloads\\Project\\Cosmoshop\\media\\survey_images"
            files_path = os.path.join(path, '*')
            files = sorted(glob.iglob(files_path), key=os.path.getctime, reverse=True)
            img = cv2.imread(files[0])
            # Wrinkle Algorithm Starts
            # converting into grayscale image
            gray_img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
            # search the coordinates of an image
            faces = face_cascade.detectMultiScale(gray_img, scaleFactor=1.05, minNeighbors=10)
            if faces == ():
                messages.update([('FaceError', 'Face Not Detected..!')])
                return render(request, "home.html", messages)
            else:
                for x, y, w, h in faces:
                    cropped_img = gray_img[y:y + h, x:x + w]
                    edges = cv2.Canny(cropped_img, 50, 800)
                    number_of_edges = np.count_nonzero(edges)
                print(str(number_of_edges))
                if number_of_edges > 700:
                    wrinkles = 1
                else:
                    wrinkles = 0

                # End of Wrinkle Algorithm
                # Skin Color Algorithm Starts
                def extractSkin(image):
                    # Taking a copy of the image
                    img = image.copy()
                    # Converting from BGR Colours Space to HSV
                    img = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)

                    # Defining HSV Threadholds
                    lower_threshold = np.array([0, 48, 80], dtype=np.uint8)
                    upper_threshold = np.array([20, 255, 255], dtype=np.uint8)

                    # Single Channel mask,denoting presence of colours in the about threshold
                    skinMask = cv2.inRange(img, lower_threshold, upper_threshold)

                    # Cleaning up mask using Gaussian Filter
                    skinMask = cv2.GaussianBlur(skinMask, (3, 3), 0)

                    # Extracting skin from the threshold mask
                    skin = cv2.bitwise_and(img, img, mask=skinMask)

                    # Return the Skin image
                    return cv2.cvtColor(skin, cv2.COLOR_HSV2BGR)

                def removeBlack(estimator_labels, estimator_cluster):

                    # Check for black
                    hasBlack = False

                    # Get the total number of occurance for each color
                    occurance_counter = Counter(estimator_labels)

                    # Quick lambda function to compare to lists
                    def compare(x, y):
                        return Counter(x) == Counter(y)

                    # Loop through the most common occuring color
                    for x in occurance_counter.most_common(len(estimator_cluster)):

                        # Quick List comprehension to convert each of RBG Numbers to int
                        color = [int(i) for i in estimator_cluster[x[0]].tolist()]

                        # Check if the color is [0,0,0] that if it is black
                        if compare(color, [0, 0, 0]) == True:
                            # delete the occurance
                            del occurance_counter[x[0]]
                            # remove the cluster
                            hasBlack = True
                            estimator_cluster = np.delete(estimator_cluster, x[0], 0)
                            break

                    return (occurance_counter, estimator_cluster, hasBlack)

                def getColorInformation(estimator_labels, estimator_cluster, hasThresholding=False):

                    # Variable to keep count of the occurance of each color predicted
                    occurance_counter = None

                    # Output list variable to return
                    colorInformation = []

                    # Check for Black
                    hasBlack = False

                    # If a mask has be applied, remove th black
                    if hasThresholding == True:

                        (occurance, cluster, black) = removeBlack(
                            estimator_labels, estimator_cluster)
                        occurance_counter = occurance
                        estimator_cluster = cluster
                        hasBlack = black

                    else:
                        occurance_counter = Counter(estimator_labels)

                    # Get the total sum of all the predicted occurances
                    totalOccurance = sum(occurance_counter.values())

                    # Loop through all the predicted colors
                    for x in occurance_counter.most_common(len(estimator_cluster)):

                        index = (int(x[0]))

                        # Quick fix for index out of bound when there is no threshold
                        index = (index - 1) if ((hasThresholding & hasBlack)
                                                & (int(index) != 0)) else index

                        # Get the color number into a list
                        color = estimator_cluster[index].tolist()
                        if color[0] > 200:
                            return "Fair"
                        elif color[0] > 100:
                            return "Wheatish"
                        elif color[0] < 100:
                            return "Dark"
                        # Get the percentage of each color
                        color_percentage = (x[1] / totalOccurance)

                        # make the dictionay of the information
                        colorInfo = {"cluster_index": index, "color": color,
                                     "color_percentage": color_percentage}

                        # Add the dictionary to the list
                        colorInformation.append(colorInfo)

                        break;
                    return "Not Detected"

                def extractDominantColor(image, number_of_colors=5, hasThresholding=False):

                    # Quick Fix Increase cluster counter to neglect the black(Read Article)
                    if hasThresholding == True:
                        number_of_colors += 1

                    # Taking Copy of the image
                    img = image.copy()

                    # Convert Image into RGB Colours Space
                    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

                    # Reshape Image
                    img = img.reshape((img.shape[0] * img.shape[1]), 3)

                    # Initiate KMeans Object
                    estimator = KMeans(n_clusters=number_of_colors, random_state=0)

                    # Fit the image
                    estimator.fit(img)

                    # Get Colour Information
                    colorInformation = getColorInformation(
                        estimator.labels_, estimator.cluster_centers_, hasThresholding)
                    return colorInformation

                # Apply Skin Mask
                skin = extractSkin(img)

                # Find the dominant color. Default is 1 , pass the parameter 'number_of_colors=N' where N is the specified number of colors
                skin_color = extractDominantColor(skin, hasThresholding=True)

                # End of Skin Color Algorithm

                # Pimple Algorithm Starts

                # pimple counter
                p = 0

                # splitting the image
                chans = cv2.split(img)
                gray = chans[1]

                adaptive = cv2.adaptiveThreshold(gray, 255, cv2.ADAPTIVE_THRESH_MEAN_C, cv2.THRESH_BINARY, 15, 5)
                kernel = np.ones((3, 3), np.uint8)
                dilation = cv2.dilate(adaptive.copy(), kernel, 2)

                # find contours in the threshold image
                cnts = cv2.findContours(dilation.copy(), cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
                cnts = imutils.grab_contours(cnts)

                # loop over the contours
                for c in cnts:
                    if (cv2.contourArea(c) > 20 and cv2.contourArea(c) < 150):
                        x, y, w, h = cv2.boundingRect(c)
                        roi = img[y:y + h, x:x + w]
                        hsr = cv2.cvtColor(roi, cv2.COLOR_BGR2HSV)
                        color = cv2.mean(hsr)
                        if (int(color[0]) < 10 and int(color[1]) > 70 and int(color[2]) > 90):
                            (a, b), radius = cv2.minEnclosingCircle(c)
                            if (int(radius) < 20):
                                x, y, w, h = cv2.boundingRect(c)
                                cv2.rectangle(img, (x, y), (x + w, y + h), (255, 0, 0), 0)
                                p += 1

                if p >= 5:
                    pimples = 1

                # Pimple Algorithm Ends

                # Passing review message

                msg = "We found"
                if wrinkles == 1:
                    msg += " Wrinkles"

                if pimples == 1:
                    if msg.find("Wrinkles") != -1:
                        msg += "and  Pimples"
                    else:
                        msg += " Pimples"

                if msg == "We found":
                    msg += " your skin is healthy and skin color is " + skin_color
                else:
                    msg += " on your skin and skin color is " + skin_color

                messages.update([('msg', msg), ('skin_color', skin_color)])
    except Exception as e:
        print("Error occured")
        print(e)
    return render(request, 'home.html',messages)



def catalog(request,search,id):
    messages = navigation_data()
    if 'name' in request.session:
        session = "on"
    else:
        session = "off"
    messages.update([('session', session)])
    if search == 'brand':
        products_details = Product.objects.filter(brand_id_id=id)
        messages.update([('Products', products_details)])
    elif search == 'category':
        sub_category1 = Sub_Category1.objects.filter(category_id_id=id)
        sub_category2_list = []
        for sub_cat1 in sub_category1:
            sub_cat = Sub_Category2.objects.filter(sub_category1_id_id=sub_cat1.sub_category1_id)
            for id in sub_cat:
                sub_category2_list.append(id.sub_category2_id)
        products_details = Product.objects.all()
        messages.update([('Sub_Categories2', sub_category2_list), ('Products', products_details)])
    elif search == 'sub_category1':
        sub_category2 = Sub_Category2.objects.filter(sub_category1_id_id=id)
        sub_category2_list = []
        for sub_cat2 in sub_category2:
            sub_category2_list.append(sub_cat2.sub_category2_id)
        products_details = Product.objects.all()
        messages.update([('Sub_Categories2',sub_category2_list),('Products', products_details)])
    elif search == 'sub_category2':
        products_details = Product.objects.filter(sub_category2_id_id=id)
        messages.update([('Products', products_details)])
    else:
        products_details = Product.objects.all()
        messages.update([('Products', products_details)])

    return render(request,"product-catalog.html",messages)


def search_catalog(request,keyword):

    if 'name' in request.session:
        session = "on"
    else:
        session = "off"
    messages = navigation_data()
    messages.update([('session', session)])
    if keyword != "":
        spell = Speller(lang='en')
        print(keyword)
        keyword = spell(keyword)
        print(keyword)
        products_details = Product.objects.filter(name__icontains=keyword)
        messages.update([('Products', products_details)])
    else:
        pass
    return render(request, "product-catalog.html", messages)


def catalog_sort(request,search,id,sort):
    if 'name' in request.session:
        session = "on"
    else:
        session = "off"
    messages = navigation_data()
    messages.update([('session', session)])

    if search == 'brand':
        if sort == 1:
            products_details = Product.objects.filter(brand_id_id=id).order_by('price')
        elif sort == 2:
            products_details = Product.objects.filter(brand_id_id=id).order_by('-price')
        else:
            products_details = Product.objects.filter(brand_id_id=id)
        messages.update([('Products', products_details)])
    elif search == 'category':
        sub_category1 = Sub_Category1.objects.filter(category_id_id=id)
        sub_category2_list = []
        for sub_cat1 in sub_category1:
            sub_cat = Sub_Category2.objects.filter(sub_category1_id_id=sub_cat1.sub_category1_id)
            for id in sub_cat:
                sub_category2_list.append(id.sub_category2_id)
        if sort == 1:
            products_details = Product.objects.all().order_by('price')
        elif sort == 2:
            products_details = Product.objects.all().order_by('-price')
        else:
            products_details = Product.objects.all()
        messages.update([('Sub_Categories2', sub_category2_list), ('Products', products_details)])
    elif search == 'sub_category1':
        sub_category2 = Sub_Category2.objects.filter(sub_category1_id_id=id)
        sub_category2_list = []
        for sub_cat2 in sub_category2:
            sub_category2_list.append(sub_cat2.sub_category2_id)
        if sort == 1:
            products_details = Product.objects.all().order_by('price')
        elif sort == 2:
            products_details = Product.objects.all().order_by('-price')
        else:
            products_details = Product.objects.all()
        messages.update([('Sub_Categories2', sub_category2_list), ('Products', products_details)])
    elif search == 'sub_category2':
        if sort == 1:
            products_details = Product.objects.filter(sub_category2_id_id=id).order_by('price')
        elif sort == 2:
            products_details = Product.objects.filter(sub_category2_id_id=id).order_by('-price')
        else:
            products_details = Product.objects.filter(sub_category2_id_id=id)
        messages.update([('Products', products_details)])
    else:
        if sort == 1:
            products_details = Product.objects.all().order_by('price')
        elif sort == 2:
            products_details = Product.objects.all().order_by('-price')
        else:
            products_details = Product.objects.all()
        messages.update([('Products', products_details)])

    return render(request, "product-catalog.html", messages)


def recommended_product_catalog(request,problem,skin_color):
    if 'name' in request.session:
        session = "on"
    else:
        session = "off"
    messages = navigation_data()
    messages.update([('session', session)])

    if problem == 'pimples':
        products_details = Product.objects.filter((Q(is_pimple_product=1)) & Q(is_wrinkle_product=0))
    elif problem == 'wrinkles':
        products_details = Product.objects.filter((Q(is_wrinkle_product=1)) & Q(is_pimple_product=0))
    else:
        products_details = Product.objects.filter(skintone__icontains=skin_color)

    messages.update([('Products', products_details)])
    return render(request, "product-catalog.html", messages)


def product_details(request,id):
    if 'name' in request.session:
        session = "on"
        customer_id = request.session['customer_id']

    else:
        session = "off"
    messages = navigation_data()
    messages.update([('session', session),('customer_id',customer_id)])

    products_details = Product.objects.filter(product_id=id)
    reviews = Review.objects.filter(product_id_id=id)
    customer = Customer.objects.all()
    messages.update([('Products', products_details),('Reviews', reviews),('Customers',customer)])
    return render(request,"product-details.html",messages)

def wishlist(request):
    if 'name' in request.session:
        session = "on"
    else:
        session = "off"
    messages = navigation_data()
    messages.update([('session', session)])
    productData = serializers.serialize("json", Product.objects.all())
    messages.update([('my_data', productData)])
    return render(request, "wishlist.html", messages)


def cart(request):
    messages = navigation_data()
    if 'name' in request.session:
        session = "on"
    else:
        session = "off"
    messages.update([('session', session)])
    productData = serializers.serialize("json", Product.objects.all())
    messages.update([('my_data', productData)])
    return render(request, "cart.html", messages)


def about_us(request):
    if 'name' in request.session:
        session = "on"
    else:
        session = "off"
    messages = navigation_data()
    messages.update([('session', session)])

    return render(request,"about-us.html",messages)

def contact_us(request):
    if 'name' in request.session:
        session = "on"
    else:
        session = "off"
    messages = navigation_data()
    messages.update([('session', session)])

    return render(request,"contact-us.html",messages)

def skin_survey(request):
    if 'name' in request.session:
        session = "on"
    else:
        session = "off"
    messages = navigation_data()
    messages.update([('session', session)])

    return render(request,"skin_survey.html",messages)

def orders(request):
    if 'name' in request.session:
        session = "on"
    else:
        session = "off"
    customer_id = request.session['customer_id']
    messages = navigation_data()
    messages.update([('session', session)])
    CustomerOrder =Customer_Order.objects.filter(customer_id=customer_id)
    product_list = []
    order_id_list = []
    order_date_list = []
    order_status_list = []
    image_list = []
    counter = 0
    product_data = []
    for order in CustomerOrder:

        products = order.productinfo
        id =  order.customer_order_id
        Odate = order.order_date
        status = order.status
        products = products.split(',')
        for p in products:
            product_list.append(p)
            p_data = Product.objects.get(product_id=p)
            data_dict = {'no':counter,'product_id':p,'image':p_data.product_image,'order_id':id,'order_date':str(Odate),'order_status':status,'product_name':p_data.name}
            product_data.append(data_dict)

            counter = counter + 1
    messages.update([('data',product_data)])
    return render(request, "orders.html", messages)



def add_review(request):
    review_message = request.POST.get("review_message")
    customer_id = request.POST.get("customer_id")
    product_id = request.POST.get("product_id")
    try:
        reviews = Review.objects.filter().order_by('-review_id')[0]
        last_review_id = reviews.review_id
        if last_review_id.find('0') != -1:
            id_array = last_review_id.split('_0')
            id = int(id_array[1]) + 1
            if id <= 9:
                new_id = "Review_0"+str(id)
            else:
                new_id = "Review_" +str(id)
        else:
            id_array = last_review_id.split('_')
            id = int(id_array[1]) + 1
            new_id = "Review_" +str(id)
    except:
        new_id = "Review_01"

    customer = Customer.objects.get(customer_id=customer_id)
    product = Product.objects.get(product_id=product_id)
    review = Review()
    review.review_id = new_id
    review.customer_id = customer
    review.product_id = product
    review.review_message = review_message
    review.is_delete = 0
    review.is_active = 1
    review.save()
    return HttpResponse('')

def registration(request):
    if 'name' in request.session:
        session = "on"
    else:
        session = "off"
    messages = navigation_data()
    messages.update([('session', session)])

    signupname = request.POST.get("signupname")
    signupmobile = request.POST.get("signupmobile")
    signupemail = request.POST.get("signupemail")
    signuppassword = request.POST.get("signuppassword")
    signupconfirmpassword = request.POST.get("signupconfirmpassword")

    if signupname != "" and signupemail != "" and signuppassword != "" and signupconfirmpassword != "" and signupmobile != "":
        try:
            last_customer_id = Customer.objects.filter().order_by('-customer_id')[0]
            last_customer_id = last_customer_id.customer_id
            if last_customer_id.find('_0') != -1:
                id_array = last_customer_id.split('_0')
                id = int(id_array[1]) + 1
                if id <= 9:
                    new_customer_id = "C_0" + str(id)
                else:
                    new_customer_id = "C_" + str(id)
            else:
                id_array = last_customer_id.split('_')
                id = int(id_array[1]) + 1
                new_customer_id = "C_" + str(id)
        except:
            new_customer_id = "C_01"
        address = Address()
        try:
            last_address_id = Address.objects.filter().order_by('-address_id')[0]
            last_address_id = last_address_id.address_id
            if last_address_id.find('_0') != -1:
                id_array = last_address_id.split('_0')
                id = int(id_array[1]) + 1
                if id <= 9:
                    new_address_id = "Add_0" + str(id)
                else:
                    new_address_id = "Add_" + str(id)
            else:
                id_array = last_address_id.split('_')
                id = int(id_array[1]) + 1
                new_address_id = "Add_" + str(id)
        except:
            new_address_id = "Add_01"
        address.address_id = new_address_id
        address.address = ""
        address.Zipcode = 0
        address.is_delete = 0
        address.is_active = 1
        city = City.objects.get(city_id='City_01')
        address.city_id = city
        address.save()
        add = Address.objects.get(address_id=new_address_id)
        customer = Customer()
        customer.customer_id = new_customer_id
        customer.address_id = add
        customer.name = signupname
        customer.contact_no = signupmobile
        customer.email_id = signupemail
        password = hashlib.md5(signuppassword.encode())
        customer.password = password.hexdigest()
        customer.is_active = 1
        customer.is_delete = 0
        role = Role.objects.get(role_id='Role_01')
        customer.role_id = role
        customer.save()
        sender = 'cosmoshopfamily@gmail.com'
        receivers = [signupemail]
        message = "Welcome "+signupname +" to Cosmoshop Family..!"
        subject = "Signup Success"
        send_mail(subject,message, sender, receivers, fail_silently=False)
        messages.update([('sigupsuccess', 'Registration Done Successfully..!')])
        return render(request, "home.html", messages)
    else:
        messages.update([('siguperror','Something Went Wrong..!Please Try Again Later')])
        return render(request, "home.html", messages)

def login(request):
    messages = navigation_data()
    loginemail = request.POST.get("loginemail")
    loginpassword = request.POST.get("loginpassword")
    password = hashlib.md5(loginpassword.encode())
    loginpassword = password.hexdigest()
    if loginemail != "" and loginpassword != "":
        customer = Customer.objects.filter(email_id=loginemail,password=loginpassword)
        if customer.exists():
            for i in customer:
                email = i.email_id
                name = i.name
                mobile = i.contact_no
                address = i.address_id
                role = i.role_id
                id = i.customer_id
            messages.update([('loginsuccess', 'Logged In Successfully..!')])
            request.session['customer_id'] = id
            request.session['email_id'] = email
            request.session['name'] = name
            request.session['contact_no'] = mobile
            request.session['address_id'] = address.address_id
            request.session['role_id'] = role.role_id
        else:
            messages.update([('loginerror', 'Invalid Email or Password..!')])
        if 'name' in request.session:
            session = "on"
        else:
            session = "off"
        messages.update([('session', session)])
        return render(request, "home.html", messages)
    else:
        if 'name' in request.session:
            session = "on"
        else:
            session = "off"
        messages.update([('session', session)])
        messages.update([('loginerror', 'Something Went Wrong..!Please Try Again Later')])
        return render(request, "home.html", messages)


def logout(request):
    request.session.flush()
    if 'name' in request.session:
        session = "on"
    else:
        session = "off"
    messages = navigation_data()
    messages.update([('session', session)])
    return render(request, "home.html", messages)


def add_contact_message(request):
    messages = navigation_data()
    name = request.POST.get("name")
    mobile = request.POST.get("mobile")
    email = request.POST.get("email")
    message = request.POST.get("message")
    if messages != "" and name != "" and mobile != "" and email != "" :
        try:
            last_contact_id = Contact_us.objects.filter().order_by('-contact_id')[0]
            last_contact_id = last_contact_id.contact_id
            if last_contact_id.find('_0') != -1:
                id_array = last_contact_id.split('_0')
                id = int(id_array[1]) + 1
                if id <= 9:
                    new_contact_id = "Contact_0" + str(id)
                else:
                    new_contact_id = "Contact_" + str(id)
            else:
                id_array = last_contact_id.split('_')
                id = int(id_array[1]) + 1
                new_contact_id = "Contact_" + str(id)

        except:
            new_contact_id = 'Contact_01'
            print("No Records..!")

        contact_us = Contact_us()
        contact_us.contact_id = new_contact_id
        contact_us.name = name
        contact_us.contact_no = mobile
        contact_us.email_id = email
        contact_us.message = message
        contact_us.is_active = 1
        contact_us.is_delete = 0
        contact_us.save()
        messages.update([('contact_added', 'Coontact Message Noted Successfully..!')])
    else:
        pass

    return render(request, "contact-us.html", messages)


def register_newsletter(request):
    messages = navigation_data()
    email = request.POST.get("newsletter_email")
    if email != "":
        try:
            last_newsletter_id = Newsletter.objects.filter().order_by('-newsletter_id')[0]
            last_newsletter_id = last_newsletter_id.newsletter_id
            if last_newsletter_id.find('_0') != -1:
                id_array = last_newsletter_id.split('_0')
                id = int(id_array[1]) + 1
                if id <= 9:
                    new_newsletter_id = "Newsletter_0" + str(id)
                else:
                    new_newsletter_id = "Newsletter_" + str(id)
            else:
                id_array = last_newsletter_id.split('_')
                id = int(id_array[1]) + 1
                new_newsletter_id = "Newsletter_" + str(id)

        except:
            new_newsletter_id = 'Newsletter_01'
            print("No Records..!")

        newsletter = Newsletter()
        newsletter.newsletter_id = new_newsletter_id
        newsletter.email_id = email
        newsletter.save()
        sender = 'cosmoshopfamily@gmail.com'
        receivers = [email]
        message = "Cosmoshop Family presents its latest newsletter volume no. XXX and edition no. XXX. Hope you enjoy it!"
        subject = "Successfully Registered For Cosmoshop NewsLetter"
        send_mail(subject, message, sender, receivers, fail_silently=False)
        messages.update([('contact_added', 'Registered for Newsletter..!')])
        return render(request, "contact-us.html", messages)


def order_information(request,amount,products):
    messages = navigation_data()
    city = City.objects.filter()
    state = State.objects.filter()
    messages.update([('states',state),('cities',city)])
    return render(request,'order_information.html',messages)

def order_processing(request):
	amount = request.POST.get("amount")
	products = request.POST.get("products")
	request.session['name'] = request.POST.get("inputname")
	request.session['email_id'] = request.POST.get("inputEmail4")
	address1 = request.POST.get("inputAddress")
	address2 = request.POST.get("inputAddress2")
	add = address1 + ',' + address2
	city_id = request.POST.get("inputCity")
	zipcode = request.POST.get("inputZip")
	request.session['contact_no'] = request.POST.get("inputPhone")
	address_id = request.session['address_id']
	city = City.objects.get(city_id=city_id)
	address = Address.objects.get(address_id=address_id)
	address.address = add
	address.Zipcode = zipcode
	address.city_id = city
	address.is_delete = 0
	address.is_active = 1
	address.save()
	return redirect('/payu_checkout' + '/' + str(amount) + '/' + str(products))



from django.views.decorators.csrf import csrf_exempt
from django.conf import settings
# Import Payu from Paywix
from paywix.payu import Payu
from django.http import JsonResponse
payu_config = settings.PAYU_CONFIG
from django.contrib import messages
merchant_key = payu_config.get('merchant_key')
merchant_salt = payu_config.get('merchant_salt')
surl = payu_config.get('success_url')
furl = payu_config.get('failure_url')
mode = payu_config.get('mode')

# Create Payu Object for making transaction
# The given arguments are mandatory
payu = Payu(merchant_key, merchant_salt, surl, furl, mode)


def payu_checkout(request,amount,products):
    # hardocded data, the values need to be changed as per requirement

    messages = navigation_data()
    if 'name' in request.session:

        data = { 'amount': (amount),
                'firstname': request.session['name'],
                'email': request.session['email_id'],
                'phone': request.session['contact_no'], 'productinfo': products,
                'lastname': '', 'address1': request.session['address_id'],
                'address2': request.session['customer_id'], 'city': 'test',
                'state': 'test', 'country': 'test',
                'zipcode': 'tes', 'udf1': '',
                'udf2': '', 'udf3': '', 'udf4': '', 'udf5': ''
        }

        txnid = "10829"
        data.update({"txnid": txnid})
        payu_data = payu.transaction(**data)
        return render(request, 'payu_checkout.html', {"posted": payu_data})
    else:
        messages.update([('orderErr','Please Login First..!')])
        return render(request, 'cart.html',messages)

# Payu success return page
@csrf_exempt
def payu_success(request):
    messages = navigation_data()
    data = {k: v[0] for k, v in dict(request.POST).items()}
    response = payu.verify_transaction(data)
    return_data = response.get('return_data')
    try:
        last_order_id = Customer_Order.objects.filter().order_by('-customer_order_id')[0]
        last_order_id = last_order_id.customer_order_id
        if last_order_id.find('_0') != -1:
            id_array = last_order_id.split('_0')
            id = int(id_array[1]) + 1
            if id <= 9:
                new_order_id = "Order_0" + str(id)
            else:
                new_order_id = "Order_" + str(id)
        else:
            id_array = last_order_id.split('_')
            id = int(id_array[1]) + 1
            new_order_id = "Order_" + str(id)

    except:
        new_order_id = 'Order_01'
        print("No Records..!")
    address_id = return_data.get('address1')
    address_id = address_id.replace(" ", "_")
    customer_id = return_data.get('address2')
    address = Address.objects.get(address_id=address_id)
    customer = Customer.objects.get(customer_id=customer_id)
    order = Customer_Order()
    order.customer_order_id = new_order_id
    order.contact_no = return_data.get('phone')
    order.order_amount = return_data.get('amount')
    order.productinfo = return_data.get('productinfo')
    today = date.today()
    order.order_date = str(today.strftime("%Y-%m-%d"))
    order.is_successful = 1
    order.is_delete = 0
    order.is_active = 1
    order.address_id = address
    order.customer_id = customer
    order.status = 'Placed'
    order.save()


    try:
        last_payment_id = Payment.objects.filter().order_by('-payment_id')[0]
        last_payment_id = last_payment_id.payment_id
        if last_payment_id.find('_0') != -1:
            id_array = last_payment_id.split('_0')
            id = int(id_array[1]) + 1
            if id <= 9:
                new_payment_id = "Payment_0" + str(id)
            else:
                new_payment_id = "Payment_" + str(id)
        else:
            id_array = last_payment_id.split('_')
            id = int(id_array[1]) + 1
            new_payment_id = "Payment_" + str(id)

    except:
        new_payment_id = 'Payment_01'
        print("No Records..!")
    order = Customer_Order.objects.get(customer_order_id=new_order_id)
    payment = Payment()
    payment.payment_id = new_payment_id
    payment.is_successful = 1
    payment.customer_order_id = order
    payment.is_delete = 0
    payment.is_active = 1
    payment.save()

    sender = 'cosmoshopfamily@gmail.com'
    receivers = [return_data.get('email')]
    message = "Yayyy..! Payment is done Successfully..!\nPlease wait for your Order to deliver..!\nThank you for ordering..!"
    subject = "Payment is done successfully"
    send_mail(subject, message, sender, receivers, fail_silently=False)
    messages.update([('orderSuccess','Your order has been placed successfully..!')])

    return render(request, 'home.html', messages)


# Payu failure page
@csrf_exempt
def payu_failure(request):
    messages = navigation_data()
    data = {k: v[0] for k, v in dict(request.POST).items()}
    response = payu.verify_transaction(data)
    messages.update([('orderError', 'Payment Failed..!Please Try Again Later..!')])
    return render(request, 'order.html', messages)

def blog(request):
    myposts = Blogpost.objects.all()
    return render(request,"blog.html",{'myposts': myposts})

def blog_post(request, id):
    post = Blogpost.objects.filter(post_id = id)[0]
    return render(request,"blog_post.html",{'post':post})

