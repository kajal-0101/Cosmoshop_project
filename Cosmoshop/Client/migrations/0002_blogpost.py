# Generated by Django 3.1.2 on 2020-10-25 22:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Client', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Blogpost',
            fields=[
                ('post_id', models.AutoField(primary_key=True, serialize=False)),
                ('title', models.CharField(default='', max_length=500)),
                ('head0', models.CharField(default='', max_length=1000)),
                ('chead0', models.CharField(default='', max_length=1000)),
                ('head1', models.CharField(default='', max_length=1000)),
                ('chead1', models.CharField(default='', max_length=1000)),
                ('head2', models.CharField(default='', max_length=1000)),
                ('chead2', models.CharField(default='', max_length=1000)),
                ('pub_date', models.DateField()),
                ('author', models.CharField(default='', max_length=1000)),
                ('is_delete', models.IntegerField(default=0, null=True)),
                ('is_active', models.IntegerField(default=1, null=True)),
                ('thumbnail', models.ImageField(default='', upload_to='upload/images')),
                ('topic', models.CharField(default='', max_length=100)),
            ],
            options={
                'db_table': 'Blogpost',
            },
        ),
    ]
