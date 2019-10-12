Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCBED5D13
	for <lists+dm-devel@lfdr.de>; Mon, 14 Oct 2019 10:05:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 902F14E908;
	Mon, 14 Oct 2019 08:05:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48E0D600CE;
	Mon, 14 Oct 2019 08:05:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7CAE180B536;
	Mon, 14 Oct 2019 08:04:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9C8kLUZ004969 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 04:46:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80AA260BF4; Sat, 12 Oct 2019 08:46:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE78F60BF1;
	Sat, 12 Oct 2019 08:46:16 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7BAF30860CB;
	Sat, 12 Oct 2019 08:46:15 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id c6so26456748ioo.13;
	Sat, 12 Oct 2019 01:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hhyQNTdR1CU2OsY9EuSKmEMJ/AEBWmqWfetcW9GtDVw=;
	b=YefTP0eFc1p2R6krwC+MN3JIsqZIU0VxvVwwpmcH9SN7zxYn9A8bq86ZyrM4P0WDoD
	OveLEWaENCYy/q4k/6rfan49R5GFpNnyhadH/O1q6cHsRnmt7w1Pjbb2CeticpIFOst2
	t7JlgdIVnFzNEiOfGs0wBFKBomvIrDvKi8xn//LQRlhy03DwMBxIi9TgxeZ3dFvCJUaZ
	w7jWywOy6B9JdiXQoRIxDEDIVuvwdOHznyq09DqW3Sh4sw493ZI7vJ9hLMZ9ucmpccfV
	3wqpS7KBBEZuRYmCJ1HhKssspuJMzu2WRkLgplvxkwYep9zOG403fR/kIC/sWSeAdGln
	X7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hhyQNTdR1CU2OsY9EuSKmEMJ/AEBWmqWfetcW9GtDVw=;
	b=rRINRtXOUQEJPgtjYs/+TpiuCJqO8QfeiL7nyIfmdeNdFrl4ntGJl5MHLkwZ2OQtWi
	I1oRYIEiQ/Nnd4Bmz5M8WrQxhMp5bMs+tFXEFRudocK8TT+/YrPIPdsMpf3WCLF2VU7z
	HUMclPNBA5kI0GR5Az4uGTV8L9STAuG+Jm+XmuWLboqGUMeE60+zw1yhSzZs0loNELnW
	Rgjggez/9RNoJI7jYrMjqlqOPbfYx5T9VBrPBLPlLfLkXQRQe9n6l6kIGOjuzdYPu+8z
	tRQn7LqtiQdXgphYxmWvQe+6WkoI+iaJSex6KacquKjvpMt7m+8wR11L2DWBXtFoY1T2
	XE7g==
X-Gm-Message-State: APjAAAXhibEU9i9HnkTHjJvzIpSzAoMv454E3thU8wfytMFjDBVAO3Mr
	ZlbhJEC0KMf7FHrwrFNiLphGEj71A9FZfyvOcOfuQVqtdiI=
X-Google-Smtp-Source: APXvYqyXHPcc0aSe7Av+kUBc5Jo+3ywSKzrh6h48cs5bb6Ag7lCCrS8Qj08Xg5gNfIBCjrcvjOKqeSgWLYo6kekuJPc=
X-Received: by 2002:a5d:80d3:: with SMTP id h19mr4644692ior.156.1570869974908; 
	Sat, 12 Oct 2019 01:46:14 -0700 (PDT)
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
In-Reply-To: <a1205abe-8675-a2d7-5ef8-3bcd00290f08@arrikto.com>
From: Guruswamy Basavaiah <guru2018@gmail.com>
Date: Sat, 12 Oct 2019 14:16:02 +0530
Message-ID: <CAHSpA5_yNRpnTEy8zNMukZFrqamKkK7cZnTAXnbC53EeHfFn4g@mail.gmail.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Sat, 12 Oct 2019 08:46:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Sat, 12 Oct 2019 08:46:16 +0000 (UTC) for IP:'209.85.166.67'
	DOMAIN:'mail-io1-f67.google.com' HELO:'mail-io1-f67.google.com'
	FROM:'guru2018@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.15  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.67 mail-io1-f67.google.com 209.85.166.67
	mail-io1-f67.google.com <guru2018@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 14 Oct 2019 04:04:24 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 14 Oct 2019 08:05:05 +0000 (UTC)

Hello Nikos,
 I am having some issues in our set-up, I will try to get the results ASAP.
Guru


On Fri, 11 Oct 2019 at 17:47, Nikos Tsironis <ntsironis@arrikto.com> wrote:
>
> On 10/11/19 2:39 PM, Nikos Tsironis wrote:
> > On 10/11/19 1:17 PM, Guruswamy Basavaiah wrote:
> >> Hello Nikos,
> >>  Applied these patches and tested.
> >>  We still see hung_task_timeout back traces and the drbd Resync is blocked.
> >>  Attached the back trace, please let me know if you need any other information.
> >>
> >
> > Hi Guru,
> >
> > Can you provide more information about your setup? The output of
> > 'dmsetup table', 'dmsetup ls --tree' and the DRBD configuration would
> > help to get a better picture of your I/O stack.
> >
> > Also, is it possible to describe the test case you are running and
> > exactly what it does?
> >
> > Thanks,
> > Nikos
> >
>
> Hi Guru,
>
> I believe I found the mistake. The in_progress variable was never
> initialized to zero.
>
> I attach a new version of the second patch correcting this.
>
> Can you please test again with this patch?
>
> Thanks,
> Nikos
>
> >>  In patch "0002-dm-snapshot-rework-COW-throttling-to-fix-deadlock.patch"
> >> I change "struct wait_queue_head" to "wait_queue_head_t" as i was
> >> getting compilation error with former one.
> >>
> >> On Thu, 10 Oct 2019 at 17:33, Nikos Tsironis <ntsironis@arrikto.com> wrote:
> >>>
> >>> On 10/10/19 9:34 AM, Guruswamy Basavaiah wrote:
> >>>> Hello,
> >>>> We use 4.4.184 in our builds and the patch fails to apply.
> >>>> Is it possible to give a patch for 4.4.x branch ?
> >>> Hi Guru,
> >>>
> >>> I attach the two patches fixing the deadlock rebased on the 4.4.x branch.
> >>>
> >>> Nikos
> >>>
> >>>>
> >>>> patching Logs.
> >>>> patching file drivers/md/dm-snap.c
> >>>> Hunk #1 succeeded at 19 (offset 1 line).
> >>>> Hunk #2 succeeded at 105 (offset -1 lines).
> >>>> Hunk #3 succeeded at 157 (offset -4 lines).
> >>>> Hunk #4 succeeded at 1206 (offset -120 lines).
> >>>> Hunk #5 FAILED at 1508.
> >>>> Hunk #6 succeeded at 1412 (offset -124 lines).
> >>>> Hunk #7 succeeded at 1425 (offset -124 lines).
> >>>> Hunk #8 FAILED at 1925.
> >>>> Hunk #9 succeeded at 1866 with fuzz 2 (offset -255 lines).
> >>>> Hunk #10 succeeded at 2202 (offset -294 lines).
> >>>> Hunk #11 succeeded at 2332 (offset -294 lines).
> >>>> 2 out of 11 hunks FAILED -- saving rejects to file drivers/md/dm-snap.c.rej
> >>>>
> >>>> Guru
> >>>>
> >>>> On Thu, 10 Oct 2019 at 01:33, Guruswamy Basavaiah <guru2018@gmail.com> wrote:
> >>>>>
> >>>>> Hello Mike,
> >>>>>  I will get the testing result before end of Thursday.
> >>>>> Guru
> >>>>>
> >>>>> On Wed, 9 Oct 2019 at 21:34, Mike Snitzer <snitzer@redhat.com> wrote:
> >>>>>>
> >>>>>> On Wed, Oct 09 2019 at 11:44am -0400,
> >>>>>> Nikos Tsironis <ntsironis@arrikto.com> wrote:
> >>>>>>
> >>>>>>> On 10/9/19 5:13 PM, Mike Snitzer wrote:> On Tue, Oct 01 2019 at  8:43am -0400,
> >>>>>>>> Nikos Tsironis <ntsironis@arrikto.com> wrote:
> >>>>>>>>
> >>>>>>>>> On 10/1/19 3:27 PM, Guruswamy Basavaiah wrote:
> >>>>>>>>>> Hello Nikos,
> >>>>>>>>>>  Yes, issue is consistently reproducible with us, in a particular
> >>>>>>>>>> set-up and test case.
> >>>>>>>>>>  I will get the access to set-up next week, will try to test and let
> >>>>>>>>>> you know the results before end of next week.
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> That sounds great!
> >>>>>>>>>
> >>>>>>>>> Thanks a lot,
> >>>>>>>>> Nikos
> >>>>>>>>
> >>>>>>>> Hi Guru,
> >>>>>>>>
> >>>>>>>> Any chance you could try this fix that I've staged to send to Linus?
> >>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.4&id=633b1613b2a49304743c18314bb6e6465c21fd8a
> >>>>>>>>
> >>>>>>>> Shiort of that, Nikos: do you happen to have a test scenario that teases
> >>>>>>>> out this deadlock?
> >>>>>>>>
> >>>>>>>
> >>>>>>> Hi Mike,
> >>>>>>>
> >>>>>>> Yes,
> >>>>>>>
> >>>>>>> I created a 50G LV and took a snapshot of the same size:
> >>>>>>>
> >>>>>>>   lvcreate -n data-lv -L50G testvg
> >>>>>>>   lvcreate -n snap-lv -L50G -s testvg/data-lv
> >>>>>>>
> >>>>>>> Then I ran the following fio job:
> >>>>>>>
> >>>>>>> [global]
> >>>>>>> randrepeat=1
> >>>>>>> ioengine=libaio
> >>>>>>> bs=1M
> >>>>>>> size=6G
> >>>>>>> offset_increment=6G
> >>>>>>> numjobs=8
> >>>>>>> direct=1
> >>>>>>> iodepth=32
> >>>>>>> group_reporting
> >>>>>>> filename=/dev/testvg/data-lv
> >>>>>>>
> >>>>>>> [test]
> >>>>>>> rw=write
> >>>>>>> timeout=180
> >>>>>>>
> >>>>>>> , concurrently with the following script:
> >>>>>>>
> >>>>>>> lvcreate -n dummy-lv -L1G testvg
> >>>>>>>
> >>>>>>> while true
> >>>>>>> do
> >>>>>>>  lvcreate -n dummy-snap -L1M -s testvg/dummy-lv
> >>>>>>>  lvremove -f testvg/dummy-snap
> >>>>>>> done
> >>>>>>>
> >>>>>>> This reproduced the deadlock for me. I also ran 'echo 30 >
> >>>>>>> /proc/sys/kernel/hung_task_timeout_secs', to reduce the hung task
> >>>>>>> timeout.
> >>>>>>>
> >>>>>>> Nikos.
> >>>>>>
> >>>>>> Very nice, well done.  Curious if you've tested with the fix I've staged
> >>>>>> (see above)?  If so, does it resolve the deadlock?  If you've had
> >>>>>> success I'd be happy to update the tags in the commit header to include
> >>>>>> your Tested-by before sending it to Linus.  Also, any review of the
> >>>>>> patch that you can do would be appreciated and with your formal
> >>>>>> Reviewed-by reply would be welcomed and folded in too.
> >>>>>>
> >>>>>> Mike
> >>>>>
> >>>>>
> >>>>>
> >>>>> --
> >>>>> Guruswamy Basavaiah
> >>>>
> >>>>
> >>>>
> >>
> >>
> >>



--
Guruswamy Basavaiah

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
