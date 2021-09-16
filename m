Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A01D140D1A6
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 04:23:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631759030;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xNWqZBbPKFFld/6Cbs/T783V0I/aMdVFoyZ6YssI8oM=;
	b=TKH34PLHVRj8Vu36V63UKRW/XrUvRLaX1ovWl+LNCnC6zkXQBHD6jdj++TZl/LFkNhOeDn
	vMmyqIUJ7usdEYlUAFBOCt7/2ZGAj567YcUjpYzH6+t8Clq/djVt0VFdiyM9SNzDOC0pZO
	ca5jfznX9PSRRTXCjB6e3vsKajM4QTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-ZbvBXneQOaOJ4aGJvqJbLg-1; Wed, 15 Sep 2021 22:23:49 -0400
X-MC-Unique: ZbvBXneQOaOJ4aGJvqJbLg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 162B71808308;
	Thu, 16 Sep 2021 02:23:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB9CE18EC5;
	Thu, 16 Sep 2021 02:23:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6EADA1809C81;
	Thu, 16 Sep 2021 02:23:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18G2Nca2028127 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Sep 2021 22:23:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CAED71981F; Thu, 16 Sep 2021 02:23:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01855604CC;
	Thu, 16 Sep 2021 02:23:35 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18G2NYR8007400; 
	Wed, 15 Sep 2021 21:23:34 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18G2NXfk007399;
	Wed, 15 Sep 2021 21:23:33 -0500
Date: Wed, 15 Sep 2021 21:23:33 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210916022333.GL3087@octiron.msp.redhat.com>
References: <20210910114120.13665-1-mwilck@suse.com>
	<20210910114120.13665-27-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210910114120.13665-27-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH 26/35] multipathd: uxlsnr: check root on
 connection startup
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

On Fri, Sep 10, 2021 at 01:41:11PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> The SO_PEERCRED socket option returns "the credentials that were
> in effect at the time of the call to connect(2)" (see unix(7)).
> So we might as well fetch these credentials at that time.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/uxlsnr.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
> index 9a945ea..9cf6964 100644
> --- a/multipathd/uxlsnr.c
> +++ b/multipathd/uxlsnr.c
> @@ -92,8 +92,6 @@ static struct pollfd *polls;
>  static int notify_fd = -1;
>  static char *watch_config_dir;
>  
> -static bool _socket_client_is_root(int fd);
> -
>  static bool _socket_client_is_root(int fd)
>  {
>  	socklen_t len = 0;
> @@ -132,6 +130,7 @@ static void new_client(int ux_sock)
>  	INIT_LIST_HEAD(&c->node);
>  	c->fd = fd;
>  	c->state = CLT_RECV;
> +	c->is_root = _socket_client_is_root(c->fd);
>  
>  	/* put it in our linked list */
>  	pthread_mutex_lock(&client_lock);
> -- 
> 2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

