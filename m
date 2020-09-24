Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 11DCD277809
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 19:50:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600969849;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4nhA1nSQy8IROHrk3lh8H0b7YJP1/TVEp6dzPydqAUM=;
	b=fAl2+JPYE4RAHgzoeKRRA6siWpvCIgcMbaRtkkU8JXeHcLRAXNZodxHdNRw6HuTDqM/zBe
	vXFFxUN1J467BlVa58EAM8gfxXmTAsKldmqOm7J9O5gpLgMgCB4APE+bZqGrFYorETyAHs
	1rNIOC1+RQlG8KBzUMZpaxR3DJyrCSI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-hMk1sp8qMou9_twP0YJhTA-1; Thu, 24 Sep 2020 13:50:46 -0400
X-MC-Unique: hMk1sp8qMou9_twP0YJhTA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A01CE64146;
	Thu, 24 Sep 2020 17:50:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F0F71A887;
	Thu, 24 Sep 2020 17:50:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 854DC8C7A0;
	Thu, 24 Sep 2020 17:50:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OHoPOm027098 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 13:50:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD89C5D993; Thu, 24 Sep 2020 17:50:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDF7A5D9D3;
	Thu, 24 Sep 2020 17:50:08 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 08OHo8Gx006405; Thu, 24 Sep 2020 13:50:08 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 08OHo8Fr006401; Thu, 24 Sep 2020 13:50:08 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 24 Sep 2020 13:50:08 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
In-Reply-To: <7b6fdfd5-0160-4bcf-b7ed-d0e51553c678@default>
Message-ID: <alpine.LRH.2.02.2009241345370.4229@file01.intranet.prod.int.rdu2.redhat.com>
References: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
	<3be1ea32-b6a8-41ef-a9ba-ed691434d068@default>
	<20200924012732.GA10766@redhat.com>
	<20200924051419.GA16103@sol.localdomain>
	<252587bb-c0b7-47c9-a97b-91422f8f9c47@default>
	<alpine.LRH.2.02.2009241314280.28814@file01.intranet.prod.int.rdu2.redhat.com>
	<7b6fdfd5-0160-4bcf-b7ed-d0e51553c678@default>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Damien.LeMoal@wdc.com, ssudhakarp@gmail.com,
	Mike Snitzer <snitzer@redhat.com>, dm-crypt@saout.de,
	Eric Biggers <ebiggers@kernel.org>, dm-devel@redhat.com,
	Shirley Ma <shirley.ma@oracle.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Milan Broz <gmazyland@gmail.com>, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH 0/2] dm crypt: Allow unaligned buffer
 lengths for skcipher devices
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Thu, 24 Sep 2020, Sudhakar Panneerselvam wrote:

> Hi Mikulas,
> 
> > > Windows Guest <--> Vhost-Scsi <--> LIO(scsi/target/blockio) <-->  dm-crypt
> > <--> iSCSI block device
> > >
> > > One real example out of my debugging: Windows sends a I/O request with
> > > 6656 bytes to vhost-scsi interface. Vhost-scsi uses translate_desc() in
> > > drivers/vhost/vhost.c to convert windows user space memory buffers to
> > > kernel iovecs. Vhost-scsi then converts the iovecs to sg entries in
> > > vhost_scsi_mapal() which is then handed over to "target" subsystem and
> > > eventually submitted to dm-crypt. This 6656 bytes IO has got 3 segments,
> > > first segment had 1584, second 4096 and the last had 976 bytes. Dm-crypt
> > > rejects the I/O after seeing the first segment length 1584 which is not
> > > a 512 byte multiple.
> > >
> > > Let me know if there are further questions.
> > >
> > > Thanks
> > > Sudhakar
> > 
> > Hi
> > 
> > I think it should be fixed in vhost-scsi.
> 
> In the above example of 6656 bytes I/O, windows allocates 6656 bytes 
> virtually contiguous I/O. This IO, when it lands in the kernel, 
> translates to 3 physically discontiguous pages, that's why 
> translate_desc() had to create 3 iovecs to handle this I/O. I don't 
> understand how vhost-scsi could have solved this issue.

By copying it to a temporary aligned buffer and issuing I/O on this 
buffer.

> Only other 
> possibility I see is to have windows fix it by always sending 512 byte 
> aligned buffer lengths, but going with my earlier point that every other 
> component in the Linux IO path handles this case well except for 
> dm-crypt, so it make more sense to fix it in dm-crypt.
> 
> Thanks
> Sudhakar

Are you sure that the problem is only with dm-crypt? You haven't tried all 
the existing block device drivers, have you?

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

