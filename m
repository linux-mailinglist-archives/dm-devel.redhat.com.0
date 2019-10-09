Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 834AFD220D
	for <lists+dm-devel@lfdr.de>; Thu, 10 Oct 2019 09:44:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02EED8AC6E0;
	Thu, 10 Oct 2019 07:44:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C57485C22C;
	Thu, 10 Oct 2019 07:44:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0AC1B4EE69;
	Thu, 10 Oct 2019 07:44:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x99K3KSk026801 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 9 Oct 2019 16:03:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DD1EF19D70; Wed,  9 Oct 2019 20:03:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx28.extmail.prod.ext.phx2.redhat.com
	[10.5.110.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF26D19C69;
	Wed,  9 Oct 2019 20:03:14 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4ED9A88382D;
	Wed,  9 Oct 2019 20:03:13 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id n26so7940391ioj.8;
	Wed, 09 Oct 2019 13:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7emUyW9ufDZ9sEL1CWgy5L8JVeQGUu3h7L+3OLaeRm4=;
	b=geN6t5PFtWCjnUD+3OpRv4F4N7t254IZLSkg87SO7getU5VAkLKjJ5kvSeYCmJ9gxo
	pW0YbXxdH97E5T/T/g6kxRTVJV5bhA1cQZrdLtCSjuWAXr47eEchjgn7A8ABWxfcee1M
	twUolMHjjkmGqFZ1ngawe/+3HhpmztIkyl3Qjl2Z/+QZa7MfEXspKorJAe3tWeYlCSfo
	/JhVa2C5kVLELUu8Iy96xTK91Wr6DoxnEyP7twCOfMjoPiPZVZSm+a5qZV3UBweDJFPQ
	fbtYjvWtyrYkIdxHL137sRaQ8+muwtMEDKOWqLqFvZwB6AhvY7vVrfgVWKBq/cQY/ZhK
	0Z9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7emUyW9ufDZ9sEL1CWgy5L8JVeQGUu3h7L+3OLaeRm4=;
	b=NA0LzdRIZNZtjHpAI3wRrSf3ScKrHzYaX1xMKb5GEBQILH6CsWiC/+9ab5UqyGwZrf
	K3+3bYPLn+7zWKuz7Oj4sxOUgqeL7cYFEnBxmfN+ycBWA4gOShxOHpc9jCz8g9Y1g8LW
	ZBDmcqZC1GRhnnU3cqiFfpwYY2I/OjO9Tu/I42nT8m2Hlh3LkIoSi3o+sWz2j1feniXx
	uFJI0gcj3aBzNHUWHcdnHw4JJiOBwdAKEPlROP5c+5f564OLbg7Ew7K0CabVV/qzJffE
	idbQNrhLIKGFo/ablJKlFSxVfF4bz+01RvJkBlJmL4vBNnX8R4e4v6JD5h8wqfZbXzex
	Q8mA==
X-Gm-Message-State: APjAAAXON0z4Z7CaOhOeUKqxXzQhjYOXMvNOsyx9cRqxttonYWJkqVek
	x1ThFwt31OBCYniBjfAx+NxeWz85CfVjpGv5gv5sPtqO
X-Google-Smtp-Source: APXvYqxvz6pzW8yQMkC4l+EMt1mD2dhuo6WTND+RukDTFYj5sR1/LmVC8HHawKa+c863e35dYbvtN33rjT4qcOzCP9o=
X-Received: by 2002:a5d:80d3:: with SMTP id h19mr2974955ior.156.1570651392223; 
	Wed, 09 Oct 2019 13:03:12 -0700 (PDT)
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
In-Reply-To: <20191009160446.GA2284@redhat.com>
From: Guruswamy Basavaiah <guru2018@gmail.com>
Date: Thu, 10 Oct 2019 01:33:01 +0530
Message-ID: <CAHSpA59T+JCR+_3ZCYShXa6GtQddAcaQE0OP5GWbSEG0qMAQOg@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.69]);
	Wed, 09 Oct 2019 20:03:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]);
	Wed, 09 Oct 2019 20:03:13 +0000 (UTC) for IP:'209.85.166.68'
	DOMAIN:'mail-io1-f68.google.com' HELO:'mail-io1-f68.google.com'
	FROM:'guru2018@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.15  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.68 mail-io1-f68.google.com 209.85.166.68
	mail-io1-f68.google.com <guru2018@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.69
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]); Thu, 10 Oct 2019 07:44:27 +0000 (UTC)

Hello Mike,
 I will get the testing result before end of Thursday.
Guru

On Wed, 9 Oct 2019 at 21:34, Mike Snitzer <snitzer@redhat.com> wrote:
>
> On Wed, Oct 09 2019 at 11:44am -0400,
> Nikos Tsironis <ntsironis@arrikto.com> wrote:
>
> > On 10/9/19 5:13 PM, Mike Snitzer wrote:> On Tue, Oct 01 2019 at  8:43am -0400,
> > > Nikos Tsironis <ntsironis@arrikto.com> wrote:
> > >
> > >> On 10/1/19 3:27 PM, Guruswamy Basavaiah wrote:
> > >>> Hello Nikos,
> > >>>  Yes, issue is consistently reproducible with us, in a particular
> > >>> set-up and test case.
> > >>>  I will get the access to set-up next week, will try to test and let
> > >>> you know the results before end of next week.
> > >>>
> > >>
> > >> That sounds great!
> > >>
> > >> Thanks a lot,
> > >> Nikos
> > >
> > > Hi Guru,
> > >
> > > Any chance you could try this fix that I've staged to send to Linus?
> > > https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.4&id=633b1613b2a49304743c18314bb6e6465c21fd8a
> > >
> > > Shiort of that, Nikos: do you happen to have a test scenario that teases
> > > out this deadlock?
> > >
> >
> > Hi Mike,
> >
> > Yes,
> >
> > I created a 50G LV and took a snapshot of the same size:
> >
> >   lvcreate -n data-lv -L50G testvg
> >   lvcreate -n snap-lv -L50G -s testvg/data-lv
> >
> > Then I ran the following fio job:
> >
> > [global]
> > randrepeat=1
> > ioengine=libaio
> > bs=1M
> > size=6G
> > offset_increment=6G
> > numjobs=8
> > direct=1
> > iodepth=32
> > group_reporting
> > filename=/dev/testvg/data-lv
> >
> > [test]
> > rw=write
> > timeout=180
> >
> > , concurrently with the following script:
> >
> > lvcreate -n dummy-lv -L1G testvg
> >
> > while true
> > do
> >  lvcreate -n dummy-snap -L1M -s testvg/dummy-lv
> >  lvremove -f testvg/dummy-snap
> > done
> >
> > This reproduced the deadlock for me. I also ran 'echo 30 >
> > /proc/sys/kernel/hung_task_timeout_secs', to reduce the hung task
> > timeout.
> >
> > Nikos.
>
> Very nice, well done.  Curious if you've tested with the fix I've staged
> (see above)?  If so, does it resolve the deadlock?  If you've had
> success I'd be happy to update the tags in the commit header to include
> your Tested-by before sending it to Linus.  Also, any review of the
> patch that you can do would be appreciated and with your formal
> Reviewed-by reply would be welcomed and folded in too.
>
> Mike



-- 
Guruswamy Basavaiah

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
