Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F09B1DA700
	for <lists+dm-devel@lfdr.de>; Thu, 17 Oct 2019 10:11:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B03D89F302;
	Thu, 17 Oct 2019 08:11:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F21BC5D9CA;
	Thu, 17 Oct 2019 08:11:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC00A18089C8;
	Thu, 17 Oct 2019 08:11:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9H5wP8r008480 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Oct 2019 01:58:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EDED2643E1; Thu, 17 Oct 2019 05:58:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx23.extmail.prod.ext.phx2.redhat.com
	[10.5.110.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37A4A60852;
	Thu, 17 Oct 2019 05:58:19 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C9A110DCC9A;
	Thu, 17 Oct 2019 05:58:18 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id w12so1480578iol.11;
	Wed, 16 Oct 2019 22:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NxONMkKc+N7mmGSd0bBaPQayZvV8Y5RuBWL/48zLqO8=;
	b=YgGCmVjDcjAjRXJ03MfbdzYEWqZgLMSfhpHf4mwHRmqwYlQgbNP9t2rSqqI0gK6rWw
	vxbPIXbqZyWcELDrstfvO90b0PkUkO/o/irNnFBPDKC2JVrcntR8n10npS54pFda43T4
	X1PizQp2vn/vtXvhqHR/T7EoTe+duBisU8xBMNbnq9WDTJMmxfA3o+y+hcwdf0e2akdg
	HqvLEzhPXFx0ANGLN0b+j18cKZ9jXl2bqVNFGR53TQXkEXgSHHSpMSWge1jWDeofGN6H
	asct2qysC57JZVsekAQBv6npHxOzG0Rfgn7n1GnVUjFe1yCErkBV/YLN5jAW/i7afw8a
	SIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NxONMkKc+N7mmGSd0bBaPQayZvV8Y5RuBWL/48zLqO8=;
	b=NYWOmZFV9tHN0bSLk7S5U3ZOtgVk9Py+F6rQJcPuNfVz4IV0HKbZZMi85ex2Vp8GCm
	L6OjMlky/SFJRjhA/kIppDDKAuehFtfYuSfGobis0y2S5OCZtQYdoqHR7EGWUzc7G0Gs
	miFZfjT6dllZakS5zF0hvY3UTkYjF9lzGmjTl5kXmFCrog4v6HWYHbbhzLVsooftxKSS
	kNxKyucgNYElURRLRU/8Vjj4rzH/U7mGY3HtPpPUFnrKL1qHX4gzi8uyIRqNWdiNefgd
	03RMWrEHXCzupz4dn5Yye9CC4MH07FP+DqZ0BeGBtUwHnnV3GC2shbHO8i+lQ09ZCHvg
	WNqA==
X-Gm-Message-State: APjAAAWuYmH6K2kVv869+COSjAQ2qVq1FjnH9l5p3WPg3PfiLe3A+HEl
	Kve+NM8LDnPCPttR4775C8BIih/C8SfXS9RfnbnR4EaHw950qg==
X-Google-Smtp-Source: APXvYqxc6scLLyC3dvXF1KhaqpNBiJ+8Xx9jNYMf19rpUyGb9nxwB3WUe3vSWRMg4TaBTCa441d8FD9xjdlon6FHWW0=
X-Received: by 2002:a02:698d:: with SMTP id e135mr1672022jac.128.1571291897078;
	Wed, 16 Oct 2019 22:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAHSpA58dehDfou0ogCYnkziBt4oU5yo1SGHLhJb7vFKy9HhJPQ@mail.gmail.com>
	<db9a2b56-244b-1285-208c-14944f559f36@arrikto.com>
	<CAHSpA58H_Vuhub6Eqqmi2QZ2g4AAUX8KCCUMzMvyc87hDaVDKg@mail.gmail.com>
	<1b2b06a1-0b68-c265-e211-48273f26efaf@arrikto.com>
	<CAHSpA59rG7qhEDjtUUTNv5evyWHS_iTL0o8utRCr9MQvMDsEgw@mail.gmail.com>
	<e15bb4d9-d19b-f954-f71d-2985dd6e455a@arrikto.com>
	<20191009141308.GA1670@redhat.com>
	<d6aaebd8-ed3e-2e6a-14ea-33bf023ee4bb@arrikto.com>
	<20191009160446.GA2284@redhat.com>
	<CAHSpA59T+JCR+_3ZCYShXa6GtQddAcaQE0OP5GWbSEG0qMAQOg@mail.gmail.com>
	<CAHSpA5_miJX74Th-_hinLr_q-sVR2G3M-_aS2c2fJBSr1eDnfg@mail.gmail.com>
	<ecf3c2cc-a0c0-ec34-7a74-8d715f774df9@arrikto.com>
	<CAHSpA5-wbyaNmnOMq+rTbuXh2eJ6y=iVjVR52OvmWLbLnUkTAw@mail.gmail.com>
	<b8246b84-957d-1903-4ab0-3f4b940b779d@arrikto.com>
	<a1205abe-8675-a2d7-5ef8-3bcd00290f08@arrikto.com>
	<CAHSpA5_yNRpnTEy8zNMukZFrqamKkK7cZnTAXnbC53EeHfFn4g@mail.gmail.com>
In-Reply-To: <CAHSpA5_yNRpnTEy8zNMukZFrqamKkK7cZnTAXnbC53EeHfFn4g@mail.gmail.com>
From: Guruswamy Basavaiah <guru2018@gmail.com>
Date: Thu, 17 Oct 2019 11:28:05 +0530
Message-ID: <CAHSpA5_F3=kfz8aduj=A1XfaOKhfJjqWNrOCveeM41tyUz2Tjg@mail.gmail.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.64]);
	Thu, 17 Oct 2019 05:58:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]);
	Thu, 17 Oct 2019 05:58:18 +0000 (UTC) for IP:'209.85.166.68'
	DOMAIN:'mail-io1-f68.google.com' HELO:'mail-io1-f68.google.com'
	FROM:'guru2018@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.15  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.68 mail-io1-f68.google.com 209.85.166.68
	mail-io1-f68.google.com <guru2018@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.64
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 17 Oct 2019 04:10:51 -0400
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>, agk@redhat.com,
	Mike Snitzer <snitzer@redhat.com>, iliastsi@arrikto.com
Subject: Re: [dm-devel] Fix "dm kcopyd: Fix bug causing workqueue stalls"
	causes dead lock
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Thu, 17 Oct 2019 08:11:23 +0000 (UTC)

Hello Nikos,
 Tested with your new patches. Issue is resolved. Thank you.
 In second patch "struct wait_queue_head" to "wait_queue_head_t" for
variable in_progress_wait, else compilation is failing with error
 "error: field 'in_progress_wait' has incomplete type
  struct wait_queue_head in_progress_wait;"
 Attached the changed patch.

Guru

On Sat, 12 Oct 2019 at 14:16, Guruswamy Basavaiah <guru2018@gmail.com> wrote:
>
> Hello Nikos,
>  I am having some issues in our set-up, I will try to get the results ASAP.
> Guru
>
>
> On Fri, 11 Oct 2019 at 17:47, Nikos Tsironis <ntsironis@arrikto.com> wrote:
> >
> > On 10/11/19 2:39 PM, Nikos Tsironis wrote:
> > > On 10/11/19 1:17 PM, Guruswamy Basavaiah wrote:
> > >> Hello Nikos,
> > >>  Applied these patches and tested.
> > >>  We still see hung_task_timeout back traces and the drbd Resync is blocked.
> > >>  Attached the back trace, please let me know if you need any other information.
> > >>
> > >
> > > Hi Guru,
> > >
> > > Can you provide more information about your setup? The output of
> > > 'dmsetup table', 'dmsetup ls --tree' and the DRBD configuration would
> > > help to get a better picture of your I/O stack.
> > >
> > > Also, is it possible to describe the test case you are running and
> > > exactly what it does?
> > >
> > > Thanks,
> > > Nikos
> > >
> >
> > Hi Guru,
> >
> > I believe I found the mistake. The in_progress variable was never
> > initialized to zero.
> >
> > I attach a new version of the second patch correcting this.
> >
> > Can you please test again with this patch?
> >
> > Thanks,
> > Nikos
> >
> > >>  In patch "0002-dm-snapshot-rework-COW-throttling-to-fix-deadlock.patch"
> > >> I change "struct wait_queue_head" to "wait_queue_head_t" as i was
> > >> getting compilation error with former one.
> > >>
> > >> On Thu, 10 Oct 2019 at 17:33, Nikos Tsironis <ntsironis@arrikto.com> wrote:
> > >>>
> > >>> On 10/10/19 9:34 AM, Guruswamy Basavaiah wrote:
> > >>>> Hello,
> > >>>> We use 4.4.184 in our builds and the patch fails to apply.
> > >>>> Is it possible to give a patch for 4.4.x branch ?
> > >>> Hi Guru,
> > >>>
> > >>> I attach the two patches fixing the deadlock rebased on the 4.4.x branch.
> > >>>
> > >>> Nikos
> > >>>
> > >>>>
> > >>>> patching Logs.
> > >>>> patching file drivers/md/dm-snap.c
> > >>>> Hunk #1 succeeded at 19 (offset 1 line).
> > >>>> Hunk #2 succeeded at 105 (offset -1 lines).
> > >>>> Hunk #3 succeeded at 157 (offset -4 lines).
> > >>>> Hunk #4 succeeded at 1206 (offset -120 lines).
> > >>>> Hunk #5 FAILED at 1508.
> > >>>> Hunk #6 succeeded at 1412 (offset -124 lines).
> > >>>> Hunk #7 succeeded at 1425 (offset -124 lines).
> > >>>> Hunk #8 FAILED at 1925.
> > >>>> Hunk #9 succeeded at 1866 with fuzz 2 (offset -255 lines).
> > >>>> Hunk #10 succeeded at 2202 (offset -294 lines).
> > >>>> Hunk #11 succeeded at 2332 (offset -294 lines).
> > >>>> 2 out of 11 hunks FAILED -- saving rejects to file drivers/md/dm-snap.c.rej
> > >>>>
> > >>>> Guru
> > >>>>
> > >>>> On Thu, 10 Oct 2019 at 01:33, Guruswamy Basavaiah <guru2018@gmail.com> wrote:
> > >>>>>
> > >>>>> Hello Mike,
> > >>>>>  I will get the testing result before end of Thursday.
> > >>>>> Guru
> > >>>>>
> > >>>>> On Wed, 9 Oct 2019 at 21:34, Mike Snitzer <snitzer@redhat.com> wrote:
> > >>>>>>
> > >>>>>> On Wed, Oct 09 2019 at 11:44am -0400,
> > >>>>>> Nikos Tsironis <ntsironis@arrikto.com> wrote:
> > >>>>>>
> > >>>>>>> On 10/9/19 5:13 PM, Mike Snitzer wrote:> On Tue, Oct 01 2019 at  8:43am -0400,
> > >>>>>>>> Nikos Tsironis <ntsironis@arrikto.com> wrote:
> > >>>>>>>>
> > >>>>>>>>> On 10/1/19 3:27 PM, Guruswamy Basavaiah wrote:
> > >>>>>>>>>> Hello Nikos,
> > >>>>>>>>>>  Yes, issue is consistently reproducible with us, in a particular
> > >>>>>>>>>> set-up and test case.
> > >>>>>>>>>>  I will get the access to set-up next week, will try to test and let
> > >>>>>>>>>> you know the results before end of next week.
> > >>>>>>>>>>
> > >>>>>>>>>
> > >>>>>>>>> That sounds great!
> > >>>>>>>>>
> > >>>>>>>>> Thanks a lot,
> > >>>>>>>>> Nikos
> > >>>>>>>>
> > >>>>>>>> Hi Guru,
> > >>>>>>>>
> > >>>>>>>> Any chance you could try this fix that I've staged to send to Linus?
> > >>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.4&id=633b1613b2a49304743c18314bb6e6465c21fd8a
> > >>>>>>>>
> > >>>>>>>> Shiort of that, Nikos: do you happen to have a test scenario that teases
> > >>>>>>>> out this deadlock?
> > >>>>>>>>
> > >>>>>>>
> > >>>>>>> Hi Mike,
> > >>>>>>>
> > >>>>>>> Yes,
> > >>>>>>>
> > >>>>>>> I created a 50G LV and took a snapshot of the same size:
> > >>>>>>>
> > >>>>>>>   lvcreate -n data-lv -L50G testvg
> > >>>>>>>   lvcreate -n snap-lv -L50G -s testvg/data-lv
> > >>>>>>>
> > >>>>>>> Then I ran the following fio job:
> > >>>>>>>
> > >>>>>>> [global]
> > >>>>>>> randrepeat=1
> > >>>>>>> ioengine=libaio
> > >>>>>>> bs=1M
> > >>>>>>> size=6G
> > >>>>>>> offset_increment=6G
> > >>>>>>> numjobs=8
> > >>>>>>> direct=1
> > >>>>>>> iodepth=32
> > >>>>>>> group_reporting
> > >>>>>>> filename=/dev/testvg/data-lv
> > >>>>>>>
> > >>>>>>> [test]
> > >>>>>>> rw=write
> > >>>>>>> timeout=180
> > >>>>>>>
> > >>>>>>> , concurrently with the following script:
> > >>>>>>>
> > >>>>>>> lvcreate -n dummy-lv -L1G testvg
> > >>>>>>>
> > >>>>>>> while true
> > >>>>>>> do
> > >>>>>>>  lvcreate -n dummy-snap -L1M -s testvg/dummy-lv
> > >>>>>>>  lvremove -f testvg/dummy-snap
> > >>>>>>> done
> > >>>>>>>
> > >>>>>>> This reproduced the deadlock for me. I also ran 'echo 30 >
> > >>>>>>> /proc/sys/kernel/hung_task_timeout_secs', to reduce the hung task
> > >>>>>>> timeout.
> > >>>>>>>
> > >>>>>>> Nikos.
> > >>>>>>
> > >>>>>> Very nice, well done.  Curious if you've tested with the fix I've staged
> > >>>>>> (see above)?  If so, does it resolve the deadlock?  If you've had
> > >>>>>> success I'd be happy to update the tags in the commit header to include
> > >>>>>> your Tested-by before sending it to Linus.  Also, any review of the
> > >>>>>> patch that you can do would be appreciated and with your formal
> > >>>>>> Reviewed-by reply would be welcomed and folded in too.
> > >>>>>>
> > >>>>>> Mike
> > >>>>>
> > >>>>>
> > >>>>>
> > >>>>> --
> > >>>>> Guruswamy Basavaiah
> > >>>>
> > >>>>
> > >>>>
> > >>
> > >>
> > >>
>
>
>
> --
> Guruswamy Basavaiah



-- 
Guruswamy Basavaiah

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
