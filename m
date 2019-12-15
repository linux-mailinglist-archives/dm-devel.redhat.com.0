Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D1EBF11FB8D
	for <lists+dm-devel@lfdr.de>; Sun, 15 Dec 2019 22:46:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576446389;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0Orglgu6ofYLGbzoB3n5amPd/JWm7kDuzJURurLcZB0=;
	b=P9ao64uqsBahddSsjc39fEONUmlJhhBjHzHcHBgRjBNVRS4VZfuWknyWk1KdbQ551GIIjo
	X8XNUbDD60OM5HNMRl3rddfU578LzD+BJs6uodpw4YsZvQnWitCC5vbSkCjjTchaEJ/Re+
	U1OIqJNjhYddpC5SVOh2E0Bx2wODrgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-CmegVzM_NUaQNhoq2oiisg-1; Sun, 15 Dec 2019 16:46:27 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5F51100550E;
	Sun, 15 Dec 2019 21:46:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A4B560933;
	Sun, 15 Dec 2019 21:46:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A24D518089C8;
	Sun, 15 Dec 2019 21:45:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBFLjVxc008337 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 15 Dec 2019 16:45:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 881AD10B2B23; Sun, 15 Dec 2019 21:45:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 830D210B2B20
	for <dm-devel@redhat.com>; Sun, 15 Dec 2019 21:45:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6319E8012A1
	for <dm-devel@redhat.com>; Sun, 15 Dec 2019 21:45:29 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69]) by
	relay.mimecast.com with ESMTP id us-mta-187-t226xD1sOs2BJNc1z21smw-1;
	Sun, 15 Dec 2019 16:45:27 -0500
Received: from localhost (localhost [127.0.0.1])
	by mx.ewheeler.net (Postfix) with ESMTP id DA63DA0692;
	Sun, 15 Dec 2019 21:45:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at ewheeler.net
Received: from mx.ewheeler.net ([127.0.0.1])
	by localhost (mx.ewheeler.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8jX8K4eRamCp; Sun, 15 Dec 2019 21:44:50 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx.ewheeler.net (Postfix) with ESMTPSA id 1D37DA0440;
	Sun, 15 Dec 2019 21:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.ewheeler.net 1D37DA0440
Date: Sun, 15 Dec 2019 21:44:49 +0000 (UTC)
From: Eric Wheeler <dm-devel@lists.ewheeler.net>
X-X-Sender: lists@mx.ewheeler.net
To: thornber@redhat.com
In-Reply-To: <alpine.LRH.2.11.1912130129120.11561@mx.ewheeler.net>
Message-ID: <alpine.LRH.2.11.1912152140020.11561@mx.ewheeler.net>
References: <35cf1ecf-5cd8-604b-ec4e-18c9fd4a4195@linux.alibaba.com>
	<20191122185530.pcrgmb655dkdbdcq@reti>
	<629bd851-8d89-00bd-0fea-d140961e8752@arrikto.com>
	<alpine.LRH.2.11.1912130129120.11561@mx.ewheeler.net>
User-Agent: Alpine 2.11 (LRH 23 2013-08-11)
MIME-Version: 1.0
X-MC-Unique: t226xD1sOs2BJNc1z21smw-1
X-MC-Unique: CmegVzM_NUaQNhoq2oiisg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBFLjVxc008337
X-loop: dm-devel@redhat.com
Cc: JeffleXu <jefflexu@linux.alibaba.com>, dm-devel@redhat.com,
	Nikos Tsironis <ntsironis@arrikto.com>
Subject: Re: [dm-devel] dm-thin: Several Questions on dm-thin performance.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 13 Dec 2019, Eric Wheeler wrote:
> On Fri, 6 Dec 2019, Nikos Tsironis wrote:
> > On 11/22/19 8:55 PM, Joe Thornber wrote:
> > > On Fri, Nov 22, 2019 at 11:14:15AM +0800, JeffleXu wrote:
> > > 
> > > > The first question is what's the purpose of data cell? In thin_bio_map(),
> > > > normal bio will be packed as a virtual cell and data cell. I can
> > > > understand
> > > > that virtual cell is used to prevent discard bio and non-discard bio
> > > > targeting the same block from being processed at the same time. I find it
> > > > was added in commit     e8088073c9610af017fd47fddd104a2c3afb32e8 (dm thin:
> > > > fix race between simultaneous io and discards to same block), but I'm
> > > > still
> > > > confused about the use of data cell.
> > > 
> > > As you are aware there are two address spaces for the locks.  The 'virtual'
> > > one
> > > refers to cells in the logical address space of the thin devices, and the
> > > 'data' one
> > > refers to the underlying data device.  There are certain conditions where we
> > > unfortunately need to hold both of these (eg, to prevent a data block being
> > > reprovisioned
> > > before an io to it has completed).
> > > 
> > > > The second question is the impact of virtual cell and data cell on IO
> > > > performance. If $data_block_size is large for example 1G, in multithread
> > > > fio
> > > > test, most bio will be buffered in cell->bios list and then be processed
> > > > by
> > > > worker thread asynchronously, even when there's no discard bio. Thus the
> > > > original parallel IO is processed by worker thread serially now. As the
> > > > number of fio test threads increase, the single worker thread can easily
> > > > get
> > > > CPU 100%, and thus become the bottleneck of the performance since dm-thin
> > > > workqueue is ordered unbound.
> > > 
> > > Yep, this is a big issue.  Take a look at dm-bio-prison-v2.h, this is the
> > > new interface that we need to move dm-thin across to use (dm-cache already
> > > uses it).
> > > It allows concurrent holders of a cell (ie, read locks), so we'll be able to
> > > remap
> > > much more io without handing it off to a worker thread.  Once this is done I
> > > want
> > > to add an extra field to cells that will cache the mapping, this way if you
> > > acquire a
> > > cell that is already held then you can avoid the expensive btree lookup.
> > > Together
> > > these changes should make a huge difference to the performance.
> > > 
> > > If you've got some spare coding cycles I'd love some help with this ;)
> > > 
> > 
> > Hi Joe,
> > 
> > I would be interested in helping you with this task. I can't make any
> > promises, but I believe I could probably spare some time to work on it.
> 
> 
> Hi Nikos, it would be great if you are able help with the 
> dm-thin port to dm-bio-prison-v2.  I'm glad to see you are interested in 
> dm-thin performance too.
> 
> These are the commits that implemented dm-bio-prison-v2 in dm-cache back 
> in ~4.12, maybe it can give you a good start on what the conversion might 
> look like:
> 
> b29d4986d dm cache: significant rework to leverage dm-bio-prison-v2
> 
> Here's a related bugfix:
> 
> d1260e2a3 dm cache: fix race condition in the writeback mode overwrite_bio optimisation

Hi Joe,

I was looking through the dm-bio-prison-v2 commit for dm-cache (b29d4986d) 
and it is huge, ~5k lines.  Do you still have a git branch with these 
commits in smaller pieces (not squashed) so we can find the bits that 
might be informative for converting lv-thin to use dm-bio-prison-v2?

For example, I think that, at least, the policy changes and 
btracker code is dm-cache specific and just a distraction when trying to 
understand the dm-bio-prison-v2 conversion.

--
Eric Wheeler


> 
> 
> 
> --
> Eric Wheeler
> 
> 
> > 
> > Nikos
> > 
> > > - Joe
> > > 
> > > --
> > > dm-devel mailing list
> > > dm-devel@redhat.com
> > > https://www.redhat.com/mailman/listinfo/dm-devel
> > > 
> > 
> > --
> > dm-devel mailing list
> > dm-devel@redhat.com
> > https://www.redhat.com/mailman/listinfo/dm-devel
> > 
> > 
> 
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
> 
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

