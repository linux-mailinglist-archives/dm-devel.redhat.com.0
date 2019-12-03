Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EC6C810FE18
	for <lists+dm-devel@lfdr.de>; Tue,  3 Dec 2019 13:52:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575377574;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kupcnXTCmp/S8kXbafn/Kf/CP9z5Sst0T0LFkQ6S4JM=;
	b=c2gfrZWAltKZ//rWrMz9Jqba7L40EqKmB4odyJpkGqLGO1vngiE1u+/Aky85mfgrtgfpgc
	8mH2LG3vF+2KQLiw56rng6Qb+XktmOuWwxK2hJI+WUVPusYblrgHXslXILOSikZB7O6Knb
	0/dPS4ECiHFFM+/BvK2fU/HzLGJ9OYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-0JrTvKVlMnagdJbkUhrtNg-1; Tue, 03 Dec 2019 07:52:50 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15F6EDB23;
	Tue,  3 Dec 2019 12:52:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C08E95DA2C;
	Tue,  3 Dec 2019 12:52:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0161818089CD;
	Tue,  3 Dec 2019 12:52:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB3CpI9B014047 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Dec 2019 07:51:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CFCA35DA60; Tue,  3 Dec 2019 12:51:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.33.36.177])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 174415DA2C;
	Tue,  3 Dec 2019 12:51:15 +0000 (UTC)
Date: Tue, 3 Dec 2019 12:51:15 +0000
From: Joe Thornber <thornber@redhat.com>
To: Eric Wheeler <dm-devel@lists.ewheeler.net>
Message-ID: <20191203125115.rdc74jgjdz2673ig@reti>
Mail-Followup-To: Eric Wheeler <dm-devel@lists.ewheeler.net>,
	JeffleXu <jefflexu@linux.alibaba.com>, dm-devel@redhat.com
References: <35cf1ecf-5cd8-604b-ec4e-18c9fd4a4195@linux.alibaba.com>
	<20191122185530.pcrgmb655dkdbdcq@reti>
	<6b12137e-411e-0368-518e-41ae54e138e0@linux.alibaba.com>
	<alpine.LRH.2.11.1912022002210.11561@mx.ewheeler.net>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.11.1912022002210.11561@mx.ewheeler.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: JeffleXu <jefflexu@linux.alibaba.com>, dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 0JrTvKVlMnagdJbkUhrtNg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Dec 02, 2019 at 10:26:00PM +0000, Eric Wheeler wrote:

> Hi Joe,
> 
> I'm not sure if I will have the time but thought I would start the 
> research and ask a few questions. I looked at the v1/v2 .h files and some 
> of the functions just change suffix to _v2 and maybe calling 
> convention/structure field changes.
> 
> However, there appear to be some design changes, too:

Yes, the interface is different, and it's really not trivial to switch dm-thin
over to use it (otherwise I'd have done it already).  dm-cache already uses
the new interface which could be used as a guide, especially if you look at the patches
that made the switch.

I'm going to write up some notes over the next couple of days.  Which I'll post on this thread.

- Joe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

