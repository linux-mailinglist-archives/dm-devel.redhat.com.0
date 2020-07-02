Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E2666212922
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 18:15:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593706529;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xnGuNCnavWjCDNIZdFkD1hwN0oSE5o5zrOoE/Yai5Ec=;
	b=DcY2mDJdKoub7ckpm6BfumsvnCXirlifQAtcfLu64ksTXUuNjMrLBElFZos05ptfhiIsqb
	J0m2LftFLobzwHoVAAs6/spYv6TxqMgpoBZ4XwD/fCSRpqxUhp8+s2D6zZQIc9p+5QZAEy
	G4/Ee0DqozToTSHCGU+Hmnn/jneimwo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-YWfV_qEzP5qP1WO31ab8wA-1; Thu, 02 Jul 2020 12:15:27 -0400
X-MC-Unique: YWfV_qEzP5qP1WO31ab8wA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5DCE10059B7;
	Thu,  2 Jul 2020 16:15:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 566BA779EB;
	Thu,  2 Jul 2020 16:15:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 242E96C9C6;
	Thu,  2 Jul 2020 16:15:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062GDc7d025073 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 12:13:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 10B2073FC1; Thu,  2 Jul 2020 16:13:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44C9273FD3;
	Thu,  2 Jul 2020 16:13:35 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 062GDXZj011729; 
	Thu, 2 Jul 2020 11:13:33 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 062GDXk3011728;
	Thu, 2 Jul 2020 11:13:33 -0500
Date: Thu, 2 Jul 2020 11:13:33 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200702161333.GC11089@octiron.msp.redhat.com>
References: <1593643176-6206-1-git-send-email-bmarzins@redhat.com>
	<1593643176-6206-2-git-send-email-bmarzins@redhat.com>
	<808a0a681be20a1d1cfe616bc5a370db7fda2ce9.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <808a0a681be20a1d1cfe616bc5a370db7fda2ce9.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/4] libmultipath: fix sysfs dev_loss_tmo
	parsing
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 02, 2020 at 02:31:17PM +0000, Martin Wilck wrote:
> On Wed, 2020-07-01 at 17:39 -0500, Benjamin Marzinski wrote:
> > dev_loss_tmo is a u32 value. However the kernel sysfs code prints it
> > as
> > a signed integer. This means that if dev_loss_tmo is above INT_MAX,
> > the
> > sysfs value will be a negative number. Parsing this was causing
> > sysfs_set_rport_tmo() to fail.
> > 
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> 
> Thanks for catching this. I think it can be fixed simpler, because 
> strtoul() parses negative values just fine. See below.

Sure. Lets go with that.

-Ben

> 
> Regards,
> Martin
> 
> >From 16eca9b0f340a13fee0c28ae52dffa578193f015 Mon Sep 17 00:00:00 2001
> From: Benjamin Marzinski <bmarzins@redhat.com>
> Date: Wed, 1 Jul 2020 17:39:33 -0500
> Subject: [PATCH] libmultipath: fix sysfs dev_loss_tmo parsing
> 
> dev_loss_tmo is a u32 value. However the kernel sysfs code prints it as
> a signed integer. This means that if dev_loss_tmo is above INT_MAX, the
> sysfs value will be a negative number. Parsing this was causing
> sysfs_set_rport_tmo() to fail.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/discovery.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> index 1d542ea..3c9803a 100644
> --- a/libmultipath/discovery.c
> +++ b/libmultipath/discovery.c
> @@ -581,7 +581,7 @@ sysfs_set_rport_tmo(struct multipath *mpp, struct path *pp)
>  	struct udev_device *rport_dev = NULL;
>  	char value[16], *eptr;
>  	char rport_id[32];
> -	unsigned long long tmo = 0;
> +	unsigned int tmo;
>  	int ret;
>  
>  	sprintf(rport_id, "rport-%d:%d-%d",
> @@ -605,8 +605,8 @@ sysfs_set_rport_tmo(struct multipath *mpp, struct path *pp)
>  			"error %d", rport_id, -ret);
>  		goto out;
>  	}
> -	tmo = strtoull(value, &eptr, 0);
> -	if (value == eptr || tmo == ULLONG_MAX) {
> +	tmo = strtoul(value, &eptr, 0);
> +	if (value == eptr) {
>  		condlog(0, "%s: Cannot parse dev_loss_tmo "
>  			"attribute '%s'", rport_id, value);
>  		goto out;
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

