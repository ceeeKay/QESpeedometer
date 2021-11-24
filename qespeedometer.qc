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

float qespeedometer_record;

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
                "\n\n\n\n\n\n\n\n\n\n\n\n\n"
                " Current:                                         \n",
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
