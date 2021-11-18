Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5519845518E
	for <lists+dm-devel@lfdr.de>; Thu, 18 Nov 2021 01:15:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637194522;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BKUwfQ9TUD7Yv0cj5HxgRNZBBw29ys8J6f+sDl0uGBk=;
	b=WHYQzlgWUYBHCXQc3OZw1+VmIjNDxCNf9qUrbhsw7528hGXN2B3aBtOoEoG89SF2TPHq0p
	eFCZwRWXOAotONzEPV+UpY792NAB7d33CgsT6orSeh0iqnN36MbqUp6CRuHepSMPefjJOK
	hMDMV+n8jx9b29FkveY2TRT4L/OiPRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-g2teid7NOFKuk2laJ3srMA-1; Wed, 17 Nov 2021 19:15:20 -0500
X-MC-Unique: g2teid7NOFKuk2laJ3srMA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6DA61006AA1;
	Thu, 18 Nov 2021 00:15:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A56EE694B5;
	Thu, 18 Nov 2021 00:15:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19EDB180BAD2;
	Thu, 18 Nov 2021 00:15:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AI0AlM3007057 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 19:10:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3CC0B60C4A; Thu, 18 Nov 2021 00:10:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4BD760C13;
	Thu, 18 Nov 2021 00:10:38 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1AI0AaDS006070; 
	Wed, 17 Nov 2021 18:10:37 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1AI0AaH5006069;
	Wed, 17 Nov 2021 18:10:36 -0600
Date: Wed, 17 Nov 2021 18:10:35 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20211118001035.GD19591@octiron.msp.redhat.com>
References: <78637f61-851d-cf9d-d308-9c22396d2071@huawei.com>
	<c410b6c9-4d46-bb64-4336-89c7af7600bc@huawei.com>
MIME-Version: 1.0
In-Reply-To: <c410b6c9-4d46-bb64-4336-89c7af7600bc@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 2/5] remove unnecessary memset
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 16, 2021 at 09:59:41PM +0800, lixiaokeng wrote:
> MALLOC will set memory zero. memset is unnecessary.
> Remove it.
> 
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/log.c  | 1 -
>  multipathd/waiter.c | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/libmultipath/log.c b/libmultipath/log.c
> index 10fa32cd..f41efb5b 100644
> --- a/libmultipath/log.c
> +++ b/libmultipath/log.c
> @@ -57,7 +57,6 @@ static int logarea_init (int size)
>  		FREE(la);
>  		return 1;
>  	}
> -	memset(la->start, 0, size);
> 
>  	la->empty = 1;
>  	la->end = la->start + size;
> diff --git a/multipathd/waiter.c b/multipathd/waiter.c
> index bbe6c2a1..f74b395a 100644
> --- a/multipathd/waiter.c
> +++ b/multipathd/waiter.c
> @@ -33,7 +33,6 @@ static struct event_thread *alloc_waiter (void)
>  	struct event_thread *wp;
> 
>  	wp = (struct event_thread *)MALLOC(sizeof(struct event_thread));
> -	memset(wp, 0, sizeof(struct event_thread));
> 
>  	return wp;
>  }
> --

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

