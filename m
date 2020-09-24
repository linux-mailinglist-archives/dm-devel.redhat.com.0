Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 713832777D3
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 19:31:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600968659;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MrIpunP3nI6uIY0bFru2LiY/HjwaWhlq2uA5n7/kKO4=;
	b=B4x4JBMmlKVKfidqKReR6ssX9g3szloaM01TJ6KQHMdDdpTpB3nqdnjCsrVM9j3bisAK/M
	3DW9YGcZM9NC5s78hqpujSDr1/U7TjP6fhJHwmPFcyAbFtrN7Fg1s9m6dkXHLtlgqhWuWz
	4ZlzzgZ2pJk6DahIL2Ut/G0p2YhxV7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-ui_qx3_CPbqAug7GXBLGUw-1; Thu, 24 Sep 2020 13:30:57 -0400
X-MC-Unique: ui_qx3_CPbqAug7GXBLGUw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93F1164146;
	Thu, 24 Sep 2020 17:30:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1DC655771;
	Thu, 24 Sep 2020 17:30:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 691E11826D2A;
	Thu, 24 Sep 2020 17:30:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OHR7Ik024936 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 13:27:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C5B3B73682; Thu, 24 Sep 2020 17:27:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8E707368C;
	Thu, 24 Sep 2020 17:27:00 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 08OHR05L004209; Thu, 24 Sep 2020 13:27:00 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 08OHQxMi004205; Thu, 24 Sep 2020 13:26:59 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 24 Sep 2020 13:26:59 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
In-Reply-To: <252587bb-c0b7-47c9-a97b-91422f8f9c47@default>
Message-ID: <alpine.LRH.2.02.2009241314280.28814@file01.intranet.prod.int.rdu2.redhat.com>
References: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
	<3be1ea32-b6a8-41ef-a9ba-ed691434d068@default>
	<20200924012732.GA10766@redhat.com>
	<20200924051419.GA16103@sol.localdomain>
	<252587bb-c0b7-47c9-a97b-91422f8f9c47@default>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Thu, 24 Sep 2020, Sudhakar Panneerselvam wrote:

> Hello Eric,
> 
> > -----Original Message-----
> > From: Eric Biggers [mailto:ebiggers@kernel.org]
> > Sent: Wednesday, September 23, 2020 11:14 PM
> > To: Mike Snitzer <snitzer@redhat.com>
> > Cc: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>;
> > Damien.LeMoal@wdc.com; ssudhakarp@gmail.com; Martin Petersen
> > <martin.petersen@oracle.com>; dm-crypt@saout.de; dm-devel@redhat.com;
> > Shirley Ma <shirley.ma@oracle.com>; mpatocka@redhat.com; Milan Broz
> > <gmazyland@gmail.com>; agk@redhat.com
> > Subject: Re: [dm-devel] [RFC PATCH 0/2] dm crypt: Allow unaligned buffer
> > lengths for skcipher devices
> > 
> > On Wed, Sep 23, 2020 at 09:27:32PM -0400, Mike Snitzer wrote:
> > > You've clearly done a nice job with these changes.  Looks clean.
> > >
> > > BUT, I'm struggling to just accept that dm-crypt needs to go to these
> > > extra lengths purely because of one bad apple usecase.
> > >
> > > These alignment constraints aren't new.  Are there other portions of
> > > Linux's crypto subsystem that needed comparable fixes in order to work
> > > with Microsfot OS initiated IO through a guest?
> > >
> > > You forecast that these same kinds of changes are needed for AEAD and
> > > dm-integrity... that's alarming.
> > >
> > > Are we _certain_ there is no other way forward?
> > > (Sorry I don't have suggestions.. I'm in "fact finding mode" ;)
> > >
> > 
> > I don't understand why this is needed, since dm-crypt already sets its
> > logical_block_size to its crypto sector_size.  Isn't it expected that I/O that
> > isn't aligned to logical_block_size fails?  It's the I/O submitter's
> > responsibility to ensure logical_block_size alignment of all I/O segments.
> > Exactly how is the misaligned I/O actually being submitted here?
> 
> You are right that each I/O size should be a multiple of the block 
> device's sector size, but I am not sure if there is any constraint that 
> individual segment lengths should be aligned to its sector size, could 
> you help me with how this is enforced in block layer? The closest I see 
> is "dma_alignment" member in "struct request_queue" of the low-level 
> block device driver and as mentioned in the patch description, iSCSI, 
> MegaRaid, qla2xxx, nvme and others have much relaxed constraint.
> 
> To your other question, the IO stack looks like this:
> 
> Windows Guest <--> Vhost-Scsi <--> LIO(scsi/target/blockio) <-->  dm-crypt <--> iSCSI block device
> 
> One real example out of my debugging: Windows sends a I/O request with 
> 6656 bytes to vhost-scsi interface. Vhost-scsi uses translate_desc() in 
> drivers/vhost/vhost.c to convert windows user space memory buffers to 
> kernel iovecs. Vhost-scsi then converts the iovecs to sg entries in 
> vhost_scsi_mapal() which is then handed over to "target" subsystem and 
> eventually submitted to dm-crypt. This 6656 bytes IO has got 3 segments, 
> first segment had 1584, second 4096 and the last had 976 bytes. Dm-crypt 
> rejects the I/O after seeing the first segment length 1584 which is not 
> a 512 byte multiple.
> 
> Let me know if there are further questions.
> 
> Thanks
> Sudhakar

Hi

I think it should be fixed in vhost-scsi.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

