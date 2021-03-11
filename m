Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 33D84337E57
	for <lists+dm-devel@lfdr.de>; Thu, 11 Mar 2021 20:44:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615491842;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pkoQRGHKM6vy8RFYZsF+AB4KnXJ35WARliJuE1+Wxg0=;
	b=bNmKGtD+XwVqpR1K/yXrqR24NbzpG5eCs8CvgndY5V3ixssa+NkEgGE13TVp26it2i5t+K
	gi1WnyLEkMuHnAFHHbEzCnfEWXsgcOaTKcgos33C6fD7rmnnEWjXwcS2sinrkW+DnF2d0O
	xExgL8LsgfFCts+7clJX4MlvGSmh20E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-opKZ3BX9PlysBYeEeds5LQ-1; Thu, 11 Mar 2021 14:43:59 -0500
X-MC-Unique: opKZ3BX9PlysBYeEeds5LQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9F47800D55;
	Thu, 11 Mar 2021 19:43:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C676B1000358;
	Thu, 11 Mar 2021 19:43:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C586A8E1C;
	Thu, 11 Mar 2021 19:43:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12BJhUJq005177 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 11 Mar 2021 14:43:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2EF1C1037EBB; Thu, 11 Mar 2021 19:43:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BA6C1000358;
	Thu, 11 Mar 2021 19:43:23 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 12BJhNAw004207; Thu, 11 Mar 2021 14:43:23 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 12BJhNeC004203; Thu, 11 Mar 2021 14:43:23 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 11 Mar 2021 14:43:23 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20210311184116.GB28637@redhat.com>
Message-ID: <alpine.LRH.2.02.2103111438170.3860@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2103111326050.28706@file01.intranet.prod.int.rdu2.redhat.com>
	<20210311184116.GB28637@redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] [PATCH v2] dm-ioctl: return UUID in
	DM_LIST_DEVICES_CMD result
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
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



On Thu, 11 Mar 2021, Mike Snitzer wrote:

> > Index: linux-2.6/include/uapi/linux/dm-ioctl.h
> > ===================================================================
> > --- linux-2.6.orig/include/uapi/linux/dm-ioctl.h	2021-03-09 12:20:23.000000000 +0100
> > +++ linux-2.6/include/uapi/linux/dm-ioctl.h	2021-03-11 18:42:14.000000000 +0100
> > @@ -193,8 +193,15 @@ struct dm_name_list {
> >  	__u32 next;		/* offset to the next record from
> >  				   the _start_ of this */
> >  	char name[0];
> > +
> > +	/* uint32_t event_nr; */
> > +	/* uint32_t flags; */
> > +	/* char uuid[0]; */
> >  };
> 
> If extra padding is being leveraged here (from the __u32 next), why not
> at least explicitly add the members and then pad out the balance of that
> __u32?  I'm not liking the usage of phantom struct members.. e.g.
> the games played with accessing them.
> 
> Mike

What exactly do you mean?

Do you want to create another structure that holds event_nr, flags and 
uuid? Or something else?

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

