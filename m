Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 656323FBE5A
	for <lists+dm-devel@lfdr.de>; Mon, 30 Aug 2021 23:31:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630359085;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gfPE/GCw/Xv/9Q8y+UdArCWRwEsI13WQ/DY9Xyg4kdM=;
	b=RzFTyosyHix9gIsWqENNvOXuKlX0hqHByDawSUON6bm1EU/9bym1cCX0Bxugjn7KwWUSjP
	6cV1TeIIa9qgYjfu8Z+gcVG8dbwWV1q2RvTQfYdnIpwcFw3iYJiSVRNxm4kKK5VVA0dUSm
	uNvRNyCqS/geL+6hhKXm16QXzKk5Lms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-lGP2SfFXOiS1uMdopX4nKQ-1; Mon, 30 Aug 2021 17:31:23 -0400
X-MC-Unique: lGP2SfFXOiS1uMdopX4nKQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07A081008062;
	Mon, 30 Aug 2021 21:31:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0F1260D31;
	Mon, 30 Aug 2021 21:31:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B1564BB7C;
	Mon, 30 Aug 2021 21:31:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17ULVDXa009239 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Aug 2021 17:31:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 238A460C9F; Mon, 30 Aug 2021 21:31:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F5BF60BF4;
	Mon, 30 Aug 2021 21:31:09 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 17ULV7RI022817; 
	Mon, 30 Aug 2021 16:31:07 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 17ULV7s6022816;
	Mon, 30 Aug 2021 16:31:07 -0500
Date: Mon, 30 Aug 2021 16:31:07 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210830213107.GC3087@octiron.msp.redhat.com>
References: <20210812104515.28541-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210812104515.28541-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] libmultipath: avoid buffer size warning with
	systemd 240+
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

On Thu, Aug 12, 2021 at 12:45:15PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Since systemd commit e39b4d2 ("libudev: re-implement udev-monitor by
> sd_device_monitor"), udev_monitor_set_receive_buffer_size() returns 1
> on success. Fix the test for the return value to avoid a misleading
> "failed to increase buffer size" warning.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/uevent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libmultipath/uevent.c b/libmultipath/uevent.c
> index d3061bf..4265904 100644
> --- a/libmultipath/uevent.c
> +++ b/libmultipath/uevent.c
> @@ -569,7 +569,7 @@ int uevent_listen(struct udev *udev)
>  	}
>  	pthread_cleanup_push(monitor_cleanup, monitor);
>  #ifdef LIBUDEV_API_RECVBUF
> -	if (udev_monitor_set_receive_buffer_size(monitor, 128 * 1024 * 1024))
> +	if (udev_monitor_set_receive_buffer_size(monitor, 128 * 1024 * 1024) < 0)
>  		condlog(2, "failed to increase buffer size");
>  #endif
>  	fd = udev_monitor_get_fd(monitor);
> -- 
> 2.32.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

