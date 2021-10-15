# Instructions

Your passport is about to expire, so you need to drop by the city office to renew it. You know from previous experience that your city office is not necessarily the most easy to deal with, so you brace yourself for the fun day that is to come.

You print out the form you need to get your new passport, fill it out, jump into your car, drive around the block, park and head to the office.

## 1. Get into the building

It turns out that the building is only open in the afternoon, and not at the same time everyday. It is almost as if they don't want people coming in at all.

Call the function `enter_building` with the current time. It should return either a tuple with `ok` and a time stamp that you will need later if the building is open, or a tuple with `:error` and a message. For now, you can return whatever you get from `enter_building`.

## 2. Go to the information desk and find which counter you should go to

The staff at the information desk is notoriously lazy, they won't do any work during their sacred, excruciatingly long, coffee breaks. If you are lucky enough to find someone on duty, you still need to understand the instructions for which counter to go to. It is so complex that they need to give visitors an instruction manual with the algorithm.

Call the function `find_counter_information` with the current time. You will get either a tuple with `:ok` and an anonymous function or a tuple with `:coffee_break` and more instructions. You are now calling two consecutive functions that could fail, so you should start using `with` with the operator `<-` to match the success cases.

If you successfully obtain the function, apply it to your birthday to find out which counter to go to. You can bind the value of the counter to a variable using `=` in the chain of clause matchings. At this stage, you can return a tuple with `:ok` and the value of the counter. If you get a `:coffee_break` message, return a tuple with `:retry` and a `NaiveDateTime` pointing to 15 minutes later.

## 3. Go to the counter and get your form stamped

You discover that for some unfathomable reason, different counters require forms of different colors. Of course, you didn't notice this on the website, instead you printed the first one you found. You curse your naivete and hope for the best.

Call the function `stamp_form` with the time stamp you received at the entrance, the counter number and the form you brought. You will get either a tuple with `:ok` and a checksum that will be used to verify your passport number or a tuple with `:error` and a message. At this stage, return whatever value you receive.

## 4. Receive your new passport

This is it, the ultimate goal, the moment you've been waiting for all day long. The oh-so-awaited new passport. Now all you have to worry about is the terrible picture of you that's inside, but at this point you don't care anymore.

Call `get_new_passport_number` with the time stamp, the counter number and the checksum you received earlier. You will receive a string with your final passport number, all that is left to do is to return that string in a tuple with `:ok` and go home.
