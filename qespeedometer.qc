// Variables and functions for QESpeedometer

// Max periods, modify centerprint code below if you change them.
float QESPEEDOMETER_A_SEC = 2;
float QESPEEDOMETER_B_SEC = 5;

// Interval max values
float qespeedometer_a_max;
float qespeedometer_b_max;

// Next time to reset max
float qespeedometer_a_next;
float qespeedometer_b_next;

// Value to print (updated each period)
float qespeedometer_a_print;
float qespeedometer_b_print;

// The current round's record
float qespeedometer_record;

// An actual speedometer! I'm not proud of this logic, but it gets results.
string QESpeedometer(float value) =
{
    if (value < 10)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                                                ]\n";
    else if (value >= 10 && value < 20)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[Q                                               ]\n";
    else if (value >= 20 && value < 30)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[ Q                                              ]\n";
    else if (value >= 30 && value < 40)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[  Q                                             ]\n";
    else if (value >= 40 && value < 50)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[   Q                                            ]\n";
    else if (value >= 50 && value < 60)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[    Q                                           ]\n";
    else if (value >= 60 && value < 70)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[     Q                                          ]\n";
    else if (value >= 70 && value < 80)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[      Q                                         ]\n";
    else if (value >= 80 && value < 90)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[       Q                                        ]\n";
    else if (value >= 90 && value < 100)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[        Q                                       ]\n";
    else if (value >= 100 && value < 110)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[         Q                                      ]\n";
    else if (value >= 110 && value < 120)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[          Q                                     ]\n";
    else if (value >= 120 && value < 130)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[           Q                                    ]\n";
    else if (value >= 130 && value < 140)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[            Q                                   ]\n";
    else if (value >= 140 && value < 150)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[             Q                                  ]\n";
    else if (value >= 150 && value < 160)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[              Q                                 ]\n";
    else if (value >= 160 && value < 170)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[               Q                                ]\n";
    else if (value >= 170 && value < 180)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                Q                               ]\n";
    else if (value >= 180 && value < 190)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                 Q                              ]\n";
    else if (value >= 190 && value < 200)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                  Q                             ]\n";
    else if (value >= 200 && value < 210)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                   Q                            ]\n";
    else if (value >= 210 && value < 220)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                    Q                           ]\n";
    else if (value >= 220 && value < 230)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                     Q                          ]\n";
    else if (value >= 230 && value < 240)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                      Q                         ]\n";
    else if (value >= 240 && value < 250)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                       Q                        ]\n";
    else if (value >= 250 && value < 260)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                        Q                       ]\n";
    else if (value >= 260 && value < 270)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                         Q                      ]\n";
    else if (value >= 270 && value < 280)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                          Q                     ]\n";
    else if (value >= 280 && value < 290)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                           Q                    ]\n";
    else if (value >= 290 && value < 300)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                            Q                   ]\n";
    else if (value >= 300 && value < 310)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                             Q                  ]\n";
    else if (value >= 310 && value < 320)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                              Q                 ]\n";
    else if (value >= 320 && value < 330)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                               Q                ]\n";
    else if (value >= 330 && value < 340)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                                Q               ]\n";
    else if (value >= 340 && value < 350)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                                 Q              ]\n";
    else if (value >= 350 && value < 360)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                                  Q             ]\n";
    else if (value >= 360 && value < 370)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                                   Q            ]\n";
    else if (value >= 370 && value < 380)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                                    Q           ]\n";
    else if (value >= 380 && value < 390)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                                     Q          ]\n";
    else if (value >= 390 && value < 400)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                                      Q         ]\n";
    else if (value >= 400 && value < 410)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                                       Q        ]\n";
    else if (value >= 410 && value < 420)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                                        Q       ]\n";
    else if (value >= 420 && value < 430)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                                         Q      ]\n";
    else if (value >= 430 && value < 440)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                                          Q     ]\n";
    else if (value >= 440 && value < 450)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                                           Q    ]\n";
    else if (value >= 450 && value < 460)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                                            Q   ]\n";
    else if (value >= 460 && value < 470)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                                             Q  ]\n";
    else if (value >= 470 && value < 480)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                                              Q ]\n";
    else if (value >= 480 && value < 490)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                                               Q]\n";
    else if (value >= 490)
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[[[[[[[[[[[[[[[[[[[[[[ WHEE ]]]]]]]]]]]]]]]]]]]]]]\n";
    else
        return "\n\n\n\n\n\n\n\n\n\n\n\n\n[                      WTF?                      ]\n";
}

void QESpeedometerRun() =
{
    // Get current speed and remove the z component
    local vector xy_velocity;
	xy_velocity = self.velocity;
	xy_velocity_z = 0;

    // Get vector length and truncate to nearest integer
    local float qespeedometer_current;
	qespeedometer_current = floor(vlen(xy_velocity));

	// Compare current speed to max
	if (qespeedometer_current > qespeedometer_a_max)
	{
		qespeedometer_a_max = qespeedometer_current;
	}
	if (qespeedometer_current > qespeedometer_b_max)
	{
		qespeedometer_b_max = qespeedometer_current;
	}
    if (qespeedometer_current > 320 && qespeedometer_current > qespeedometer_record)
    {
        qespeedometer_record = qespeedometer_current;
        bprint (self.netname);
        bprint (" set a new record of ");
        bprint (ftos(qespeedometer_record));
        bprint ("\n");
    }

	// Store max for printing, reset to zero, and reset time period
	if ((time) >= (qespeedometer_a_next))
	{
		qespeedometer_a_print = qespeedometer_a_max;
		qespeedometer_a_max = 0;
		qespeedometer_a_next = (time) + QESPEEDOMETER_A_SEC;
		// sprint(self, "speedometer a tick at ");
		// sprint(self, ftos(time));
		// sprint(self, "\n");
	}
	if ((time) >= (qespeedometer_b_next))
	{
		qespeedometer_b_print = qespeedometer_b_max;
		qespeedometer_b_max = 0;
		qespeedometer_b_next = (time) + QESPEEDOMETER_B_SEC;
		// sprint(self, "speedometer b tick at ");
		// sprint(self, ftos(time));
		// sprint(self, "\n");
	}

	// Let the welcome message print
	if (time < 5)
		return;

	// QESpeedometer display, centerprint can do 7 strings, 50 characters wide
	// Time names need to be hard-coded here due to lack of enough parameters
	centerprint(self,
                QESpeedometer(qespeedometer_current),
                ftos(qespeedometer_current),
                "                                        \n"

                "  Last 2 sec max:                                 \n",
                ftos(qespeedometer_a_print),
                "                                        \n"

                "  Last 5 sec max:                                 \n",
                ftos(qespeedometer_b_print),
                "                                        "
                );
}
