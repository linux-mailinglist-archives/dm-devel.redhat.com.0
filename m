Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 87866716F4D
	for <lists+dm-devel@lfdr.de>; Tue, 30 May 2023 23:00:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685480450;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iuXdOxkrjq2xexH1R8+UXHVNNSM9t143PYqwXQj+xWQ=;
	b=R4UyOzIRqgsCQqCZuYnbEDMTAvCqHcermwrbcd3SLf9X3ktdJKz/F6cLyjOJCdSn+0kiIq
	TfIjo1vWWJel7mLqXOXc8GzxfW7EWARkhPZbjizzqXNDUxroUry0CdC4Ioxw5h0qZqa21L
	QdIAOAiTKz7/RgWt5SqDdoRvTMmeb1A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-vaV8N3o1MfKGZSun2_LxCQ-1; Tue, 30 May 2023 17:00:48 -0400
X-MC-Unique: vaV8N3o1MfKGZSun2_LxCQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18AB63C11CDE;
	Tue, 30 May 2023 21:00:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 90D7D40C6EC4;
	Tue, 30 May 2023 21:00:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2545219465B9;
	Tue, 30 May 2023 21:00:41 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2497B19465A0
 for <dm-devel@listman.corp.redhat.com>; Tue, 30 May 2023 21:00:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E2DF740C6EC4; Tue, 30 May 2023 21:00:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1E1640C1437;
 Tue, 30 May 2023 21:00:39 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 34UL0d5h028698; Tue, 30 May 2023 17:00:39 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 34UL0dCe028695; Tue, 30 May 2023 17:00:39 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Tue, 30 May 2023 17:00:39 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Kent Overstreet <kent.overstreet@linux.dev>
In-Reply-To: <ZHUcmeYrUmtytdDU@moria.home.lan>
Message-ID: <alpine.LRH.2.21.2305300809350.13307@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.21.2305260915400.12513@file01.intranet.prod.int.rdu2.redhat.com>
 <ZHUcmeYrUmtytdDU@moria.home.lan>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [dm-devel] fuzzing bcachefs with dm-flakey
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
Cc: linux-fsdevel@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Mon, 29 May 2023, Kent Overstreet wrote:

> On Mon, May 29, 2023 at 04:59:40PM -0400, Mikulas Patocka wrote:
> > Hi
> > 
> > I improved the dm-flakey device mapper target, so that it can do random 
> > corruption of read and write bios - I uploaded it here: 
> > https://people.redhat.com/~mpatocka/testcases/bcachefs/dm-flakey.c
> > 
> > I set up dm-flakey, so that it corrupts 10% of read bios and 10% of write 
> > bios with this command:
> > dmsetup create flakey --table "0 `blockdev --getsize /dev/ram0` flakey /dev/ram0 0 0 1 4 random_write_corrupt 100000000 random_read_corrupt 100000000"
> 
> I've got some existing ktest tests for error injection:
> https://evilpiepirate.org/git/ktest.git/tree/tests/bcachefs/single_device.ktest#n200
> https://evilpiepirate.org/git/ktest.git/tree/tests/bcachefs/replication.ktest#n491
> 
> I haven't looked at dm-flakey before, I take it you're silently
> corrupting data instead of just failing the IOs like these tests do?

Yes, silently corrupting.

When I tried to simulate I/O errors with dm-flakey, bcachefs worked 
correcly - there were no errors returned to userspace and no crashes.

Perhaps, it should treat metadata checksum errors in the same way as disk 
failures?

> Let's add what you're doing to ktest, and see if we can merge it with
> the existing tests.

> Good catches on all of them. Darrick's been on me to get fuzz testing
> going, looks like it's definitely needed :)
> 
> However, there's two things I want in place first before I put much
> effort into fuzz testing:
> 
>  - Code coverage analysis. ktest used to have integrated code coverage
>    analysis, where you'd tell it a subdirectory of the kernel tree
>    (doing code coverage analysis for the entire kernel is impossibly
>    slow) and it would run tests and then give you the lcov output.
> 
>    However, several years ago something about kbuild changed, and the
>    method ktest was using for passing in build flags for a specific
>    subdir on the command line stopped working. I would like to track
>    down someone who understands kbuild and get this working again.
> 
>  - Fault injection
> 
>    Years and years ago, when I was still at Google and this was just
>    bcache, we had fault injection that worked like dynamic debug: you
>    could call dynamic_fault("type of fault") anywhere in your code,
>    and it returned a bool indicating whether that fault had been enabled
>    - and faults were controllable at runtime via debugfs, we had tests
>    that iterated over e.g. faults in the initialization path, or memory
>    allocation failures, and flipped them on one by one and ran
>    $test_workload.
> 
>    The memory allocation profiling stuff that Suren and I have been
>    working on includes code tagging, which is for (among other things) a
>    new and simplified implementation of dynamic fault injection, which
>    I'm going to push forward again once the memory allocation profiling
>    stuff gets merged.
> 
> The reason I want this stuff is because fuzz testing tends to be a
> heavyweight, scattershot approach.
> 
> I want to be able to look at the code coverage analysis first to e.g.
> work on a chunk of code at a time and make sure it's tested thoroughly,
> instead of jumping around in the code at random depending on what fuzz
> testing finds, and when we are fuzz testing I want to be able to add
> fault injection points and write unit tests so that we can have much
> more targeted, quicker to run tests going forward.
> 
> Can I get you interested in either of those things? I'd really love to
> find someone to hand off or collaborate with on the fault injection
> stuff in particular.

I'd like to know how do you want to do coverage analysis? By instrumenting 
each branch and creating a test case that tests that the branch goes both 
ways?

I know that people who write spacecraft-grade software do such tests, but 
I can't quite imagine how would that work in a filesystem.

"grep -w if fs/bcachefs/*.[ch] | wc -l" shows that there are 5828 
conditions. That's one condition for every 15.5 lines.

Mikulas
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

