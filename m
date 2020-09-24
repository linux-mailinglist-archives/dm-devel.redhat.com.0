Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A4F2F2778AB
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 20:46:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600973166;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=63RY+CCK2YHh92Iu4tUzMp0RdOpwAWYraX7a8FeVQPI=;
	b=ZKgI+3l8QGJExDkZvioNu5vUQ889SAwL+but7tWwgnmAP9+pcu8SpxdUfd/MuedVO2lroN
	8/lC5mvlVzUrD2+toO88KOHfSN3G2oTSZ1YbrYPH3DYEdXMzqzz1QXH3ou0tom05fBBzAJ
	19acXlppohXPgCbz6vO56+HGNXjq1mQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-RjKgHL_GO72yONwgcWrIDw-1; Thu, 24 Sep 2020 14:46:04 -0400
X-MC-Unique: RjKgHL_GO72yONwgcWrIDw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8D6D64094;
	Thu, 24 Sep 2020 18:45:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5570873682;
	Thu, 24 Sep 2020 18:45:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 901391826D2F;
	Thu, 24 Sep 2020 18:45:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OIieSR032681 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 14:44:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A321873684; Thu, 24 Sep 2020 18:44:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F6847368C;
	Thu, 24 Sep 2020 18:44:34 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 08OIiXs2012361; Thu, 24 Sep 2020 14:44:33 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 08OIiXmD012357; Thu, 24 Sep 2020 14:44:33 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 24 Sep 2020 14:44:33 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
In-Reply-To: <fd512a7d-c064-4812-a794-5274c10687db@default>
Message-ID: <alpine.LRH.2.02.2009241421170.8544@file01.intranet.prod.int.rdu2.redhat.com>
References: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
	<3be1ea32-b6a8-41ef-a9ba-ed691434d068@default>
	<20200924012732.GA10766@redhat.com>
	<20200924051419.GA16103@sol.localdomain>
	<252587bb-c0b7-47c9-a97b-91422f8f9c47@default>
	<alpine.LRH.2.02.2009241314280.28814@file01.intranet.prod.int.rdu2.redhat.com>
	<7b6fdfd5-0160-4bcf-b7ed-d0e51553c678@default>
	<alpine.LRH.2.02.2009241345370.4229@file01.intranet.prod.int.rdu2.redhat.com>
	<fd512a7d-c064-4812-a794-5274c10687db@default>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Thu, 24 Sep 2020, Sudhakar Panneerselvam wrote:

> > By copying it to a temporary aligned buffer and issuing I/O on this
> > buffer.
> 
> I don't like this idea. Because, you need to allocate additional pages 
> for the entire I/O size(for the misaligned case, if you think through 

You can break the I/O to smaller pieces. You can use mempool for 
pre-allocation of the pages.

> carefully, you will know why we have to allocate a temporary buffer that 
> is as big as the original IO) and on top of it, copying the buffer from 
> original to temporary buffer which is all unnecessary while it can 
> simply be fixed in dm-crypt without any of these additional overheads.
> 
> > 
> > > Only other
> > > possibility I see is to have windows fix it by always sending 512 byte
> > > aligned buffer lengths, but going with my earlier point that every other
> > > component in the Linux IO path handles this case well except for
> > > dm-crypt, so it make more sense to fix it in dm-crypt.
> > >
> > > Thanks
> > > Sudhakar
> > 
> > Are you sure that the problem is only with dm-crypt? You haven't tried all
> > the existing block device drivers, have you?
> 
> My question is, why dm-crypt worries about alignment requirement of 
> other layers? Is there anything that impacts dm-crypt if the segment 
> lengths are not aligned?(I believe this case is just not handled so far 

Because the code is simpler if it assumes aligned buffers.

> in dm-crypt and my patch addresses it). Should dm-crypt not just pass on 
> all those I/O requests to those respective layers to handle it which 
> will be more graceful?
> 
> -Sudhakar

So, suppose that we change dm-crypt to handle your workload - what are you 
going to do with other block device drivers that assume aligned bio vector 
length? How will you find all the other drivers that need to be changed?

You are claiming that "every other component in the Linux IO path handles 
this case well except for dm-crypt", but this claim is wrong. There are 
other driver that don't handle misaligned length as well.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

