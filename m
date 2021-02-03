Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C199F30E729
	for <lists+dm-devel@lfdr.de>; Thu,  4 Feb 2021 00:22:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612394523;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nrbZ/pthBcYetbBrcn6J03d250uY2gm2kQDhootommg=;
	b=TvCWyxAVXk0G1FiLmc7p/QVwfHscmENbZ3CovRRcW6ULkUVr9iWBnqM4XOJQzI4AX4ssKt
	DdlnNJ3WHzRP+6fdHGZIK4+1PXJOO9fzA99qUBDwU6H5K97pskk/l74Z1a4omLnazUcs+Q
	US+KPwJT2IsNraVTgo2n6OQ3kYPCfO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-A6N7IuWuOlG7rELEpwp-fg-1; Wed, 03 Feb 2021 18:22:01 -0500
X-MC-Unique: A6N7IuWuOlG7rELEpwp-fg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2467107ACE3;
	Wed,  3 Feb 2021 23:21:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A608C6091B;
	Wed,  3 Feb 2021 23:21:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FDCA18095CB;
	Wed,  3 Feb 2021 23:21:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 113NLSJx001021 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 18:21:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B6CF16091B; Wed,  3 Feb 2021 23:21:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F7C0779DC;
	Wed,  3 Feb 2021 23:21:25 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 113NLOPv022141; 
	Wed, 3 Feb 2021 17:21:24 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 113NLNMa022140;
	Wed, 3 Feb 2021 17:21:23 -0600
Date: Wed, 3 Feb 2021 17:21:22 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210203232122.GB15006@octiron.msp.redhat.com>
References: <20210202214131.19901-1-mwilck@suse.com>
	<20210202214131.19901-4-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210202214131.19901-4-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 3/3] libmultipath: check return value of
 udev_device_get_devnum()
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 02, 2021 at 10:41:31PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> udev_device_get_devnum() may fail, in which case it returns
> makedev(0, 0).
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/discovery.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> index 921025d..15cf641 100644
> --- a/libmultipath/discovery.c
> +++ b/libmultipath/discovery.c
> @@ -1659,6 +1659,9 @@ common_sysfs_pathinfo (struct path * pp)
>  		return PATHINFO_FAILED;
>  	}
>  	devt = udev_device_get_devnum(pp->udev);
> +	if (major(devt) == 0 && minor(devt) == 0)
> +		return PATHINFO_FAILED;
> +
>  	snprintf(pp->dev_t, BLK_DEV_SIZE, "%d:%d", major(devt), minor(devt));
>  
>  	condlog(4, "%s: dev_t = %s", pp->dev, pp->dev_t);
> -- 
> 2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

