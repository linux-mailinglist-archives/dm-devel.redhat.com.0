Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2F42813ACA2
	for <lists+dm-devel@lfdr.de>; Tue, 14 Jan 2020 15:50:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579013453;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Jc0JfPX9Io5PUF5jsiik56Jdf3Xgs2uK7w7ROc8Zrrk=;
	b=XCrKmL0bPWkdlW50xXbDJLTcinYOaBriA8D6O7Z/vQLOV+oeksPy1H61Je/pii2t66o942
	iCPwL6kWMt5hjtp9qrClPIEclSH/lZPmmSmmpDQ7nXsMYHZrInXbB00Gbc8plFMFEvxpfj
	yseGD7RQvx1yaXD5xw76odY2yveiy7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-u7I9f6j1O5SUr8usw8n3EQ-1; Tue, 14 Jan 2020 09:50:52 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 894D38024D6;
	Tue, 14 Jan 2020 14:50:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CA325C299;
	Tue, 14 Jan 2020 14:50:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B1911832961;
	Tue, 14 Jan 2020 14:50:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EEoNX8013480 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 09:50:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 89F105DA76; Tue, 14 Jan 2020 14:50:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16B2E5D9E5;
	Tue, 14 Jan 2020 14:50:20 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 00EEoKal016073; Tue, 14 Jan 2020 09:50:20 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 00EEoKlC016069; Tue, 14 Jan 2020 09:50:20 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 14 Jan 2020 09:50:20 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Maged Mokhtar <mmokhtar@petasan.org>
In-Reply-To: <a858b409-d3d5-b439-5f15-563fb5316d2a@petasan.org>
Message-ID: <alpine.LRH.2.02.2001140943090.15105@file01.intranet.prod.int.rdu2.redhat.com>
References: <598c7c64-9b11-3407-2060-8d43b1ef1241@petasan.org>
	<d76f7245-034c-f225-00fe-f33c5e9abf1a@petasan.org>
	<alpine.LRH.2.02.2001021144450.18253@file01.intranet.prod.int.rdu2.redhat.com>
	<a858b409-d3d5-b439-5f15-563fb5316d2a@petasan.org>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mike Snitzer <msnitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm writecache: SB remove seq_count
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: u7I9f6j1O5SUr8usw8n3EQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Mon, 13 Jan 2020, Maged Mokhtar wrote:

> 
> 
> > Hi
> > 
> > 
> > On Thu, 2 Jan 2020, Maged Mokhtar wrote:
> > 
> > > Any feedback on this patch please.
> > 
> > This will definitely not work for persistent memory - it could corrupt
> > data if a crash happens. The CPU can flush data in arbitrary order and it
> > may happen that the seq count is flushed before the pertaining data.
> > 
> > As for SSD mode - we could avoid updating the refcount in the superblock,
> > but it wouldn't be much helpful.
> > 
> > I.e. normally, commit is done this way:
> > 1. submit data writes
> > 2. submit metadata writes
> > 3. flush disk cache
> > 4. submit the write of superblock with increased seq_count
> > 5. flush disk cache
> > 
> > If we wanted to avoid writing the seq_count, we would need to change it
> > to:
> > 1. submit data writes
> > 2. flush disk cache
> > 3. submit metadata writes
> > 4. flush disk cache
> > 
> > - i.e. it sill needs two disk cache flushes per one commit request - and
> > it is not much better than the existing solution.
> > 
> > Mikulas
> > 
> 
> 
> Hi Mikulas,
> 
> I appreciate your review. For SSD mode, I see the advantages of SB writes for
> handling crash recovery and agree with what you say. Note however that after a
> crash a proper client should not assume the data is valid on a device, only at
> the point it last issued a successful flush should the data be consistent,

Yes.

> after this it should not assume so. A filesystem/db should handle
> journals/transaction at a higher level than the device. But again anything we
> can do on the device/target to make things more consistent, the better, so i
> agree there.
> 
> There is also limit to what the current crash recovery code can do, as i
> understand it if you have metadata already committed, their seq count is not
> incremented for new io on the same blocks, the crash recovery code will
> therefore not detect or recover cases where new data is written to existing 4k
> blocks at the time of crash, some blocks will end up with new data, others
> will not. Again this is my understanding so i could be wrong.

If the userspace writes some block, it is unspecified if the block will 
contain old data or new data after a crash. (the SCSI standard at some 
point even specified that the written block may contain arbitrary data - 
not just old or new).

> I think if crash consistency needs to be enhanced, it should take into account
> that most consumer/non-enterprise SSDs do not offer power loss protection. For

Both SATA and SCSI standard have command that flushes the cache in the 
disk or SSD. If the SSD ignores this command, it is broken.

> many such devices power loss can corrupt data that is already written as they
> commit data in larger chunks via a read/modify/erase/write cycle. It is
> particularly bad for metadata as it could affect many data blocks. Maybe it
> could be good to have metadata writes via transactions or journaling, dm-cache
> and thin provisioning do something like this i think.

Both dm-cache and dm-writecache use the flush command to write the device 
cache.

> i also think your suggestion of:
> > If we wanted to avoid writing the seq_count, we would need to change it
> > to:
> > 1. submit data writes
> > 2. flush disk cache
> > 3. submit metadata writes
> > 4. flush disk cache
> 
> could be better in terms of prolonging SSD lifetime, as currently the
> superblock gets much higher write frequency.

The SSDs allocate new blocks with each write, so it doesn't matter that we 
write the same block multiple times. With real persistent memory, it may 
be an issue.

> /Maged

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

