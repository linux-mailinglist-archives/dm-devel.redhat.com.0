Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A471A40D19B
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 04:18:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631758729;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LYJYc/J8e2W6ozPty9Vcbw/JXJDbv6BW+sNtoACeLvM=;
	b=ZZjrRlqP38cZx4a2YH9Atcc+8EbY9p4xCwtqLlfFQx0gtpESVq6b1dVbwDue4O+LH2Jm9z
	1UJdKzbB57u2xZQV9i/6cKtulCW89Nlv+bd+GB/AzuzFxyZH61a+msp+C8KiQwga/wRj1Z
	LDh0TQtrOJ2pgVFnSVL3c0BDHpvcreA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-eKVNVO96OfOfbBkYGmuqfg-1; Wed, 15 Sep 2021 22:18:48 -0400
X-MC-Unique: eKVNVO96OfOfbBkYGmuqfg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A8548145E7;
	Thu, 16 Sep 2021 02:18:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1107A18EC5;
	Thu, 16 Sep 2021 02:18:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C2401803B30;
	Thu, 16 Sep 2021 02:18:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18G2Id10027707 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Sep 2021 22:18:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3EB46604CC; Thu, 16 Sep 2021 02:18:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A9736A257;
	Thu, 16 Sep 2021 02:18:36 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18G2IYXT007343; 
	Wed, 15 Sep 2021 21:18:34 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18G2IYT4007342;
	Wed, 15 Sep 2021 21:18:34 -0500
Date: Wed, 15 Sep 2021 21:18:34 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210916021834.GD3087@octiron.msp.redhat.com>
References: <20210910114120.13665-1-mwilck@suse.com>
	<20210910114120.13665-19-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210910114120.13665-19-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH 18/35] multipathd: uxlsnr: avoid using fd -1
	in ppoll()
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

On Fri, Sep 10, 2021 at 01:41:03PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Minor edit: if notifications are off, we set the poll fd to
> -1 but still use the POLLIN mask. It looks nicer if to poll
> the correct fd, but reset the event mask to 0 if we're not
> actually interested in it.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/uxlsnr.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
> index 6506109..98a9f71 100644
> --- a/multipathd/uxlsnr.c
> +++ b/multipathd/uxlsnr.c
> @@ -357,11 +357,11 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
>  		}
>  
>  		reset_watch(notify_fd, &wds, &sequence_nr);
> +		polls[POLLFD_NOTIFY].fd = notify_fd;
>  		if (notify_fd == -1 || (wds.conf_wd == -1 && wds.dir_wd == -1))
> -			polls[POLLFD_NOTIFY].fd = -1;
> +			polls[POLLFD_NOTIFY].events = 0;
>  		else
> -			polls[POLLFD_NOTIFY].fd = notify_fd;
> -		polls[POLLFD_NOTIFY].events = POLLIN;
> +			polls[POLLFD_NOTIFY].events = POLLIN;
>  
>  		/* setup the clients */
>  		i = POLLFDS_BASE;
> -- 
> 2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

