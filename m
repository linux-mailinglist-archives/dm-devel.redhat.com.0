Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 81591277170
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 14:47:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600951675;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4vA3xYdSB8jSXzOJz46IaKO/bZnFU3UI4re55o48Pkg=;
	b=Bhl6uskdFeqcy5iJLOxwW4YfDCtkTvi4Rtozo4pNR+zjV0ltHOLLlOOctX14oOUhlTetsE
	NsVz7YrUKfaBw3EJoI8yjT/hDkXFdS66ZBfOAsqhgp/Szud/9i0oeVtvUe+seu28qyAhrw
	Vb22nWe61wl+aVRfxFSTx+ixd9spG2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-gtLJ34wbMf2tFJaSCGVrwg-1; Thu, 24 Sep 2020 08:47:53 -0400
X-MC-Unique: gtLJ34wbMf2tFJaSCGVrwg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF74356BE6;
	Thu, 24 Sep 2020 12:47:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82BA51002397;
	Thu, 24 Sep 2020 12:47:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6CD67181A71E;
	Thu, 24 Sep 2020 12:47:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OClbFQ018623 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 08:47:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F3005D9F3; Thu, 24 Sep 2020 12:47:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0AAF5D9D2;
	Thu, 24 Sep 2020 12:47:30 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 08OClUKu003471; Thu, 24 Sep 2020 08:47:30 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 08OClUn8003467; Thu, 24 Sep 2020 08:47:30 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 24 Sep 2020 08:47:30 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20200924012732.GA10766@redhat.com>
Message-ID: <alpine.LRH.2.02.2009240845330.11084@file01.intranet.prod.int.rdu2.redhat.com>
References: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
	<3be1ea32-b6a8-41ef-a9ba-ed691434d068@default>
	<20200924012732.GA10766@redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Damien.LeMoal@wdc.com, ssudhakarp@gmail.com,
	Martin Petersen <martin.petersen@oracle.com>, dm-crypt@saout.de,
	Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>,
	dm-devel@redhat.com, Shirley Ma <shirley.ma@oracle.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Wed, 23 Sep 2020, Mike Snitzer wrote:

> You've clearly done a nice job with these changes.  Looks clean.
> 
> BUT, I'm struggling to just accept that dm-crypt needs to go to these
> extra lengths purely because of one bad apple usecase.
> 
> These alignment constraints aren't new.  Are there other portions of
> Linux's crypto subsystem that needed comparable fixes in order to work
> with Microsfot OS initiated IO through a guest?
> 
> You forecast that these same kinds of changes are needed for AEAD and
> dm-integrity... that's alarming.

... and dm-writecache also expects that the bio is aligned ...

Mikulas

> Are we _certain_ there is no other way forward?
> (Sorry I don't have suggestions.. I'm in "fact finding mode" ;)
> 
> Thanks,
> Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

