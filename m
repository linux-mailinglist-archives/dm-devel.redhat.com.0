Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3C19E1306F4
	for <lists+dm-devel@lfdr.de>; Sun,  5 Jan 2020 10:40:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578217219;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NxHUQuBSCf9o69Gs1SU5JYF/ceGxOQo158KymfCWEvE=;
	b=W2OHKKrtKQClN57aCEFGH//8IDxcXK1gblI2ulLhSnSEUr6lln081fPcwxH/NVXGQBmLti
	0x+R4QOdvSqBqgGYXZ3cM/roaf8qw4zh62w216dtu2vJvpTw92YwPeBfSWVt/q6d2S02Ie
	7XU29UWtsRia32ngJZqCEyZ4Y/4+kYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-M3sgFoN2M2exncy_mw-1aw-1; Sun, 05 Jan 2020 04:40:17 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22195DB20;
	Sun,  5 Jan 2020 09:40:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 007EF5D9CD;
	Sun,  5 Jan 2020 09:40:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5629118089C8;
	Sun,  5 Jan 2020 09:39:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0059dLgp029618 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 5 Jan 2020 04:39:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8260710840EB; Sun,  5 Jan 2020 09:39:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C26E108131B;
	Sun,  5 Jan 2020 09:39:19 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 0059dIal007681; Sun, 5 Jan 2020 04:39:18 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 0059dISP007678; Sun, 5 Jan 2020 04:39:18 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Sun, 5 Jan 2020 04:39:18 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Patrick Dung <patdung100@gmail.com>
In-Reply-To: <CAJTWkdvOtgzrrJiT+FQccCFu4sXzncHZDo7=RW5TWqiw8rxfLg@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.2001050431590.6830@file01.intranet.prod.int.rdu2.redhat.com>
References: <CAJTWkdu1-k5m0F-uzp-EMrncL1w4wLqEi8LgF0U1Js_Nf-YphQ@mail.gmail.com>
	<alpine.LRH.2.02.2001031206190.11685@file01.intranet.prod.int.rdu2.redhat.com>
	<CAJTWkdvOtgzrrJiT+FQccCFu4sXzncHZDo7=RW5TWqiw8rxfLg@mail.gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] About dm-integrity layer and fsync
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: M3sgFoN2M2exncy_mw-1aw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Sat, 4 Jan 2020, Patrick Dung wrote:

> Thanks for reply. After performing an additional testing with SSD. I have more questions.
> 
> Firstly, about the additional testing with SSD:
> I tested it with SSD (in Linux software raid level 10 setup). The result shown using dm-integrity is faster than using XFS directly. For using dm-integrity, fio shows
> lots of I/O merges by the scheduler. Please find the attachment for the result.
> 
> Finally, please find the questions below:
> 1) So after the dm-integrity journal is written to the actual back end storage (hard drive), then fsync would then report completed?

Yes.

> 2) To my understanding, for using dm-integrity with journal mode. Data has to written into the storage device twice (one part is the dm-integrity journal, the other
> one is the actual data). For the fio test, the data should be random and sustained for 60 seconds. But using dm-integrity with journal mode is still faster.
> 
> Thanks,
> Patrick

With ioengine=sync, fio sends one I/O, waits for it to finish, send 
another I/O, wait for it to finish, etc.

With dm-integrity, I/Os will be written to the journal (that is held in 
memory, no disk I/O is done), and when fio does the sync(), fsync() or 
fdatasync() syscall, the journal is written to the disk. After the journal 
is flushed, the blocks are written concurrently to the disk locations.

The SSD has better performance for concurrent write then for 
block-by-block write, so that's why you see performance improvement with 
dm-integrity.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

