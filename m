Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D14B86ACBD7
	for <lists+dm-devel@lfdr.de>; Mon,  6 Mar 2023 19:02:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678125775;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=24WIKLPuRdsvhPA5Fgzg65iP0RHdBx4WTTsqKsiNhVU=;
	b=TIriM6T/IE+q8VguPCq9ONVLGAMwbrSAOYGaR5jXJKqNkc9mIujH7GvRLaiH7MXt+SsU0i
	l8rNJ8jiEh2W/mjTXqeKG6EN4Q0jCIwq+toYd0YNm6H33bBnDGHTVeyVWE3fff/Vl2l6et
	IjgSeIf1r4lEu1vspxZF7OZ6T+uAL28=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-EX_F3U4eNfqJHjbWntiRBg-1; Mon, 06 Mar 2023 13:02:53 -0500
X-MC-Unique: EX_F3U4eNfqJHjbWntiRBg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6388885CBE7;
	Mon,  6 Mar 2023 18:02:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4BAA840C945A;
	Mon,  6 Mar 2023 18:02:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5029419465B1;
	Mon,  6 Mar 2023 18:02:41 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E2ED3194658C
 for <dm-devel@listman.corp.redhat.com>; Mon,  6 Mar 2023 18:02:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 94C5714171C4; Mon,  6 Mar 2023 18:02:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7388114171C3;
 Mon,  6 Mar 2023 18:02:33 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 326I2Xb1001525; Mon, 6 Mar 2023 13:02:33 -0500
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 326I2XbK001521; Mon, 6 Mar 2023 13:02:33 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Mon, 6 Mar 2023 13:02:33 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: yangerkun <yangerkun@huaweicloud.com>
In-Reply-To: <3e31584c-b0f3-fc9a-3657-935fc51db74e@huaweicloud.com>
Message-ID: <alpine.LRH.2.21.2303061240200.31427@file01.intranet.prod.int.rdu2.redhat.com>
References: <20230223031947.3717433-1-yangerkun@huaweicloud.com>
 <b7020147-2382-71f6-5237-8501562f8011@acm.org>
 <e69ec125-3636-ab20-ce63-f4b89ac55ffb@huaweicloud.com>
 <Y/zueUWERryoIGA8@redhat.com> <Y/zwVCNDrdAbzC7a@redhat.com>
 <Y/zxI4wK8trtuJgV@redhat.com>
 <3e31584c-b0f3-fc9a-3657-935fc51db74e@huaweicloud.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [dm-devel] dm-crypt: fix softlockup in dmcrypt_write
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: yangerkun@huawei.com, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@redhat.com, agk@redhat.com, Bart Van Assche <bvanassche@acm.org>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 BOUNDARY="185206533-1323629815-1678124569=:31427"
Content-ID: <alpine.LRH.2.21.2303061243150.31427@file01.intranet.prod.int.rdu2.redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
--185206533-1323629815-1678124569=:31427
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.LRH.2.21.2303061243151.31427@file01.intranet.prod.int.rdu2.redhat.com>



On Tue, 28 Feb 2023, yangerkun wrote:

> 
> 
> 在 2023/2/28 2:06, Mike Snitzer 写道:
> > On Mon, Feb 27 2023 at  1:03P -0500,
> > Mike Snitzer <snitzer@kernel.org> wrote:
> > 
> >> On Mon, Feb 27 2023 at 12:55P -0500,
> >> Mike Snitzer <snitzer@kernel.org> wrote:
> >>
> >>> On Sun, Feb 26 2023 at  8:31P -0500,
> >>> yangerkun <yangerkun@huaweicloud.com> wrote:
> >>>
> >>>>
> >>>>
> >>>> 在 2023/2/26 10:01, Bart Van Assche 写道:
> >>>>> On 2/22/23 19:19, yangerkun wrote:
> >>>>>> @@ -1924,6 +1926,10 @@ static int dmcrypt_write(void *data)
> >>>>>>            BUG_ON(rb_parent(write_tree.rb_node));
> >>>>>> +        if (time_is_before_jiffies(start_time + HZ)) {
> >>>>>> +            schedule();
> >>>>>> +            start_time = jiffies;
> >>>>>> +        }
> >>>>>
> >>>>> Why schedule() instead of cond_resched()?
> >>>>
> >>>> cond_resched may not really schedule, which may trigger the problem too,
> but
> >>>> it seems after 1 second, it may never happend?
> >>>
> >>> I had the same question as Bart when reviewing your homegrown
> >>> conditional schedule().  Hopefully you can reproduce this issue?  If
> >>> so, please see if simply using cond_resched() fixes the issue.
> >>
> >> This seems like a more appropriate patch:
> >>
> >> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> >> index 87c5706131f2..faba1be572f9 100644
> >> --- a/drivers/md/dm-crypt.c
> >> +++ b/drivers/md/dm-crypt.c
> >> @@ -1937,6 +1937,7 @@ static int dmcrypt_write(void *data)
> >>   			io = crypt_io_from_node(rb_first(&write_tree));
> >>   			rb_erase(&io->rb_node, &write_tree);
> >>   			kcryptd_io_write(io);
> >> +			cond_resched();
> >>   		} while (!RB_EMPTY_ROOT(&write_tree));
> >>   		blk_finish_plug(&plug);
> >>   	}
> > 
> > 
> > or:
> > 
> > diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> > index 87c5706131f2..3ba2fd3e4358 100644
> > --- a/drivers/md/dm-crypt.c
> > +++ b/drivers/md/dm-crypt.c
> > @@ -1934,6 +1934,7 @@ static int dmcrypt_write(void *data)
> >   		 */
> >   		blk_start_plug(&plug);
> >   		do {
> > +			cond_resched();
> >   			io = crypt_io_from_node(rb_first(&write_tree));
> >   			rb_erase(&io->rb_node, &write_tree);
> >   			kcryptd_io_write(io);
> 
> Hi,
> 
> Thanks a lot for your review!
> 
> It's ok to fix the softlockup, but for async write encrypt, 
> kcryptd_crypt_write_io_submit will add bio to write_tree, and once we 
> call cond_resched before every kcryptd_io_write, the write performance 
> may be poor while we meet a high cpu usage scene.

Hi

To fix this problem, find the PID of the process "dmcrypt_write" and 
change its priority to -20, for example "renice -n -20 -p 34748".

This is the proper way how to fix it; locking up the process for one 
second is not.

We used to have high-priority workqueues by default, but it caused audio 
playback skipping, so we had to revert it - see 
f612b2132db529feac4f965f28a1b9258ea7c22b.

Perhaps we should add an option to have high-priority kernel threads?

Mikulas

> kcryptd_crypt_write_io_submit will wakeup write_thread once there is a 
> empty write_tree, and dmcrypt_write will peel the old write_tree to 
> submit bio, so there can not exist too many bio in write_tree. Then I 
> choose yield cpu before the 'while' that submit bio...
> 
> Thanks,
> Kun.
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://listman.redhat.com/mailman/listinfo/dm-devel
> 
--185206533-1323629815-1678124569=:31427
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

--185206533-1323629815-1678124569=:31427--

