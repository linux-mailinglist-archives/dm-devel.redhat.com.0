Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 042A3302E37
	for <lists+dm-devel@lfdr.de>; Mon, 25 Jan 2021 22:46:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611611200;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tmk8UaoXfOvFTDnjxVORmYrWW4gtI8BwmuV8NB74jFk=;
	b=KD/QZNFy7GvzD4nxdKbJ+tC/3TJLSF2HMNATkJ3SIstEIQfD9Qz22WI102FWOOGP6cZQzG
	wPdxsRdY0EfpI+9jzq5AfqsMhL4lzk65xtXlbfoaWoIM7axVBAjjkEAOdbSW2lTm7z5SXF
	UdJpULjbSeJuVc0X4Mn3UIycO3m6pXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-jLeUOZXAN3SfW7OfQPAMmw-1; Mon, 25 Jan 2021 16:46:37 -0500
X-MC-Unique: jLeUOZXAN3SfW7OfQPAMmw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4842C15720;
	Mon, 25 Jan 2021 21:46:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 732745D6AB;
	Mon, 25 Jan 2021 21:46:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3128E4BB7B;
	Mon, 25 Jan 2021 21:46:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10PLkAiU029591 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 25 Jan 2021 16:46:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3DE905D6DC; Mon, 25 Jan 2021 21:46:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5DD15D6AB;
	Mon, 25 Jan 2021 21:46:09 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 10PLk8bn005324; 
	Mon, 25 Jan 2021 15:46:08 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 10PLk6rq005323;
	Mon, 25 Jan 2021 15:46:06 -0600
Date: Mon, 25 Jan 2021 15:46:06 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210125214606.GD15006@octiron.msp.redhat.com>
References: <20210125152304.28024-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210125152304.28024-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] libmultipath: snprint_devices(): avoid NULL
	dereference
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 25, 2021 at 04:23:04PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> All libudev functions may return NULL. Watch out for it.
> 
> Fixes: d041258 ("libmultipath: snprint_devices(): use udev_enumerate"
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/print.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/libmultipath/print.c b/libmultipath/print.c
> index 19de2c7..8151e11 100644
> --- a/libmultipath/print.c
> +++ b/libmultipath/print.c
> @@ -2055,8 +2055,16 @@ int snprint_devices(struct config *conf, char *buff, size_t len,
>  		struct udev_device *u_dev;
>  
>  		path = udev_list_entry_get_name(item);
> +		if (!path)
> +			continue;
>  		u_dev = udev_device_new_from_syspath(udev, path);
> +		if (!u_dev)
> +			continue;
>  		devname = udev_device_get_sysname(u_dev);
> +		if (!devname) {
> +			udev_device_unref(u_dev);
> +			continue;
> +		}
>  
>  		fwd += snprintf(buff + fwd, len - fwd, "    %s", devname);
>  		if (fwd >= len)
> -- 
> 2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

