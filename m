Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC0BD220F
	for <lists+dm-devel@lfdr.de>; Thu, 10 Oct 2019 09:45:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50423C057F23;
	Thu, 10 Oct 2019 07:45:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3957600C4;
	Thu, 10 Oct 2019 07:45:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6101418089DC;
	Thu, 10 Oct 2019 07:45:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9A6Z94h022488 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Oct 2019 02:35:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B5E05D6C8; Thu, 10 Oct 2019 06:35:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx22.extmail.prod.ext.phx2.redhat.com
	[10.5.110.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA1BD5D6A5;
	Thu, 10 Oct 2019 06:35:02 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B8C7218CB903;
	Thu, 10 Oct 2019 06:35:01 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id h144so11191212iof.7;
	Wed, 09 Oct 2019 23:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZZD/CJd62tG66QcRvqetgEEpcprBbvtkzIhvoEhQgUI=;
	b=te5jr4QL0/hnCxDWjGiEd6EMzlt5wz0ayvKLiMU+CxA0whrKv6pxB9Al6wgtRVIlTd
	Zg+gaahvJ9nRfw16mFjoayC+sZn6uS3ewPz5V1FVuFlxryiItkNjYFd1hYlazrKanKkz
	ww0eZC2mzRMi3VRLhxpe4hVmgmxKdBCBrzzPSzyvhfy5GoVCHqb82tNL1AYYFJYD8DzU
	e5UgRsMi07QlxWbb3VaZ7s2qeDMZtIOYKvlniDkEHN+KUocVg8ORB8g5e20fN0yqMUuI
	5gFzXT8tlpPUiIXCSH1/nZpWYuuAW0I7kPgvd8vWxc8/AlLReM0nNtQYuh9FpXIMrmMK
	PCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZZD/CJd62tG66QcRvqetgEEpcprBbvtkzIhvoEhQgUI=;
	b=lZKHLYwTiiugsiW17hj0iz3kIYEhEw3+NsR61nyMrsDvPN7ZEv8FuN0rAUJ5pxXPdC
	aEGqumtUolMJhQayPbdgdMYXNm4tACAWb/GNCAFe98rX4eHOyCKlmztUbH+SDkNkphMP
	+0XnLtO6xmiVSJeRkIS9zPIhlJo8BHcsC73afR83HDyg+TQKNGQmgb/6lnTYPRJluFl7
	haWbjwPnk95aUyZm0FLe3YpXLfkcq5FqZMVaLQoJVM3mi+CRRefxq8QWnE2XWEJyoaXj
	HGuJiAhWD3gN0wVtBGPH1rsb398kqXrGlrXK6c440/dA9HY/c5iaAwdCsQPZ3vHSHTFU
	Q4Ww==
X-Gm-Message-State: APjAAAW4+9zvDGP4UnnWtOK2zFe0No6tPQ3Yz2ENpVAXqg10U+1ehxDz
	415XLUXVufuPW2c7iZYpBhU5kOfnGq9js/kED8m1Qkyk+CQ=
X-Google-Smtp-Source: APXvYqwsHvWDJwm4eEq7yEPVSmW9sBAAIMlxTE9at/pyHwto6Ma7rU3v4MQYLY332pDJvKRHnDzp4Gqd8MQurcptpT4=
X-Received: by 2002:a6b:f30f:: with SMTP id m15mr413108ioh.44.1570689300613;
	Wed, 09 Oct 2019 23:35:00 -0700 (PDT)
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
In-Reply-To: <CAHSpA59T+JCR+_3ZCYShXa6GtQddAcaQE0OP5GWbSEG0qMAQOg@mail.gmail.com>
From: Guruswamy Basavaiah <guru2018@gmail.com>
Date: Thu, 10 Oct 2019 12:04:50 +0530
Message-ID: <CAHSpA5_miJX74Th-_hinLr_q-sVR2G3M-_aS2c2fJBSr1eDnfg@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.63]);
	Thu, 10 Oct 2019 06:35:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]);
	Thu, 10 Oct 2019 06:35:01 +0000 (UTC) for IP:'209.85.166.66'
	DOMAIN:'mail-io1-f66.google.com' HELO:'mail-io1-f66.google.com'
	FROM:'guru2018@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.15  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.66 mail-io1-f66.google.com 209.85.166.66
	mail-io1-f66.google.com <guru2018@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.63
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 10 Oct 2019 03:42:31 -0400
Cc: dm-devel@redhat.com, Nikos Tsironis <ntsironis@arrikto.com>, agk@redhat.com,
	iliastsi@arrikto.com
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 10 Oct 2019 07:45:23 +0000 (UTC)

Hello,
We use 4.4.184 in our builds and the patch fails to apply.
Is it possible to give a patch for 4.4.x branch ?

patching Logs.
patching file drivers/md/dm-snap.c
Hunk #1 succeeded at 19 (offset 1 line).
Hunk #2 succeeded at 105 (offset -1 lines).
Hunk #3 succeeded at 157 (offset -4 lines).
Hunk #4 succeeded at 1206 (offset -120 lines).
Hunk #5 FAILED at 1508.
Hunk #6 succeeded at 1412 (offset -124 lines).
Hunk #7 succeeded at 1425 (offset -124 lines).
Hunk #8 FAILED at 1925.
Hunk #9 succeeded at 1866 with fuzz 2 (offset -255 lines).
Hunk #10 succeeded at 2202 (offset -294 lines).
Hunk #11 succeeded at 2332 (offset -294 lines).
2 out of 11 hunks FAILED -- saving rejects to file drivers/md/dm-snap.c.rej

Guru

On Thu, 10 Oct 2019 at 01:33, Guruswamy Basavaiah <guru2018@gmail.com> wrote:
>
> Hello Mike,
>  I will get the testing result before end of Thursday.
> Guru
>
> On Wed, 9 Oct 2019 at 21:34, Mike Snitzer <snitzer@redhat.com> wrote:
> >
> > On Wed, Oct 09 2019 at 11:44am -0400,
> > Nikos Tsironis <ntsironis@arrikto.com> wrote:
> >
> > > On 10/9/19 5:13 PM, Mike Snitzer wrote:> On Tue, Oct 01 2019 at  8:43am -0400,
> > > > Nikos Tsironis <ntsironis@arrikto.com> wrote:
> > > >
> > > >> On 10/1/19 3:27 PM, Guruswamy Basavaiah wrote:
> > > >>> Hello Nikos,
> > > >>>  Yes, issue is consistently reproducible with us, in a particular
> > > >>> set-up and test case.
> > > >>>  I will get the access to set-up next week, will try to test and let
> > > >>> you know the results before end of next week.
> > > >>>
> > > >>
> > > >> That sounds great!
> > > >>
> > > >> Thanks a lot,
> > > >> Nikos
> > > >
> > > > Hi Guru,
> > > >
> > > > Any chance you could try this fix that I've staged to send to Linus?
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.4&id=633b1613b2a49304743c18314bb6e6465c21fd8a
> > > >
> > > > Shiort of that, Nikos: do you happen to have a test scenario that teases
> > > > out this deadlock?
> > > >
> > >
> > > Hi Mike,
> > >
> > > Yes,
> > >
> > > I created a 50G LV and took a snapshot of the same size:
> > >
> > >   lvcreate -n data-lv -L50G testvg
> > >   lvcreate -n snap-lv -L50G -s testvg/data-lv
> > >
> > > Then I ran the following fio job:
> > >
> > > [global]
> > > randrepeat=1
> > > ioengine=libaio
> > > bs=1M
> > > size=6G
> > > offset_increment=6G
> > > numjobs=8
> > > direct=1
> > > iodepth=32
> > > group_reporting
> > > filename=/dev/testvg/data-lv
> > >
> > > [test]
> > > rw=write
> > > timeout=180
> > >
> > > , concurrently with the following script:
> > >
> > > lvcreate -n dummy-lv -L1G testvg
> > >
> > > while true
> > > do
> > >  lvcreate -n dummy-snap -L1M -s testvg/dummy-lv
> > >  lvremove -f testvg/dummy-snap
> > > done
> > >
> > > This reproduced the deadlock for me. I also ran 'echo 30 >
> > > /proc/sys/kernel/hung_task_timeout_secs', to reduce the hung task
> > > timeout.
> > >
> > > Nikos.
> >
> > Very nice, well done.  Curious if you've tested with the fix I've staged
> > (see above)?  If so, does it resolve the deadlock?  If you've had
> > success I'd be happy to update the tags in the commit header to include
> > your Tested-by before sending it to Linus.  Also, any review of the
> > patch that you can do would be appreciated and with your formal
> > Reviewed-by reply would be welcomed and folded in too.
> >
> > Mike
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
