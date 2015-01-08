

EMAIL:

We can create a new view for email under the app/views/user_mailer directory.
We call it registration_confirmation.text.erb. We can say anything that we want and it appear as the body of the email.

For sending the mail, we add a line in users_controller.rb file
    UserMailer.method_name(@user).deliver

Example
 def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        UserMailer.mailer(@user).deliver
        format.html { redirect_to @user, notice: 'User was successfully created.' }...\

Functional Requirements
○ We need to record temperature readings for various thermometers installed in different parts of a house (something one could potentially build using Arduinos)
○ And we need to set two simple rules where an alert email should be sent ­ with details on thermometer/condition etc.
■ If the temperature in a specific thermometer goes over a certain number
■ If a particular thermometer has not sent a reading in 5 minutes
○ Allow users to sign in using their Google account. Users should see and configure only their
own data.
● UI Requirements
○ There should be a simple admin web page that lets us do the following
■ Add a new thermometer and give it a unique name
■ Enter a value for the max temperature rule. This is done once.
■ Enter a value for the email id where alerts will be sent
○ A simple dashboard that shows temperatures for each of the configured thermometers.
● Technical Requirements
○ UI Layer (Wireframes): Create simple wireframes using Balsamiq or any other wireframing tool.
○ Data model: Create a set of tables with constraints to meet the above requirements. This database should be designed using SQL using DDL: (e.g. CREATE TABLE SQL statements )
■ Make sure you set up PRIMARY KEYs and FOREIGN KEYs.
● Make sure constraints are set up correctly e.g. you should not able to
DELETE any thermometers for which temperature readings exist (using
SQL DELETE statements).
● Add three columns to all your tables: created_at, updated_at, created_by,
updated_by
■ Next, using Rails, generate the model classes. ( Note that this is the reverse of
what is typically done with Rails)
○ Design the relevant test cases and the rest of your model classes, HTML’s based on the
functional requirements above. Use Twitter Bootstrap and Angular.
○ For sending/receiving temperature readings: design a JSON service that receives three
pieces of data: thermometer name, reading and time and adds it to your database. Then emulate temperature readings by calling that JSON service. You may want to automate (using random numbers) the sending of temperature readings by writing a simple JavaScript program that can be triggered from the browser.
○ Make sure you receive emails when the high temperature rule threshold is met or a thermometer does not send data for more than 5 minutes.
○ Add logging to your system so you can monitor the health of your app and debug any issues
        