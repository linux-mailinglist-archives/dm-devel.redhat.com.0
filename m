Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E9E6019DC00
	for <lists+dm-devel@lfdr.de>; Fri,  3 Apr 2020 18:48:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585932532;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V+2XFj0fRjXrfkxylpho2EyMU0hlnpfRb0LbH8GK4XU=;
	b=B0fC6GVkKUZC1VCZISE5nEtyV9Ht7GtMkD6zOLOgBQfz6E7m9rjHiJjXTDyyyduT9ICXI4
	0aFX9nGlrP7P6kJKWDb0Iq06z9vVl5n32JNHKwxCSlUKnUFdmN+K5IOIsmdJRTohfp+B+i
	vno/eg/PkxTBsYmox6B7Cc3o8bqhhb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-z8gUPnhFMpeIUZKxBFuj6A-1; Fri, 03 Apr 2020 12:48:49 -0400
X-MC-Unique: z8gUPnhFMpeIUZKxBFuj6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76E8A100551A;
	Fri,  3 Apr 2020 16:48:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCAEA99E15;
	Fri,  3 Apr 2020 16:48:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9BAE14E455;
	Fri,  3 Apr 2020 16:48:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 033GmY0M001531 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Apr 2020 12:48:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A24E099E15; Fri,  3 Apr 2020 16:48:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A78199E18;
	Fri,  3 Apr 2020 16:48:31 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 033GmTMc030475; 
	Fri, 3 Apr 2020 11:48:30 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 033GmTMJ030474;
	Fri, 3 Apr 2020 11:48:29 -0500
Date: Fri, 3 Apr 2020 11:48:28 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200403164828.GD5907@octiron.msp.redhat.com>
References: <20200403111914.30717-1-mwilck@suse.com>
	<20200403111914.30717-3-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200403111914.30717-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, vliaskovitis@suse.com
Subject: Re: [dm-devel] [PATCH v2 2/2] kpartx.rules: check for skip_kpartx
 on synthetic uevents
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Apr 03, 2020 at 01:19:14PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> The current test to detect "spurious" uevents, and thus whether to
> import DM_SUBSYSTEM_UDEV_FLAG1 (the flag for the "skip_kpartx" option)
> from the udev db is wrong. In 10-dm.rules, DM_UDEV_PRIMARY_SOURCE_FLAG
> is imported from the db if it isn't set, meaning that it's always 1
> for active maps. The only events for which DM_SUBSYSTEM_UDEV_FLAG1
> must not be loaded from the db are the real "primary" events, which
> are "change" events with DM_ACTIVATION=="1".
> 
> 11-dm-mpath.rules resets DM_ACTIVATION to 0 if nothing should change in upper
> layers. In this case importing DM_SUBSYSTEM_UDEV_FLAG1 is correct, too. kpartx
> will not be called anyway, because 11-dm-mpath.rules also sets MPATH_UNCHANGED=1.
> 

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  kpartx/kpartx.rules | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/kpartx/kpartx.rules b/kpartx/kpartx.rules
> index f1bf31ca..d7527d7d 100644
> --- a/kpartx/kpartx.rules
> +++ b/kpartx/kpartx.rules
> @@ -13,8 +13,11 @@ ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}=="1", GOTO="kpartx_end"
>  ENV{DM_UUID}!="mpath-?*", GOTO="mpath_kpartx_end"
>  
>  # DM_SUBSYSTEM_UDEV_FLAG1 is the "skip_kpartx" flag.
> -# For events not generated by libdevmapper, we need to fetch it from db.
> -ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}!="1", IMPORT{db}="DM_SUBSYSTEM_UDEV_FLAG1"
> +# For events not generated by libdevmapper, we need to fetch it from db:
> +# - "change" events with DM_ACTIVATION!="1" (e.g. partition table changes)
> +# - "add" events for which rules are not disabled ("coldplug" case)
> +ENV{DM_ACTIVATION}!="1", IMPORT{db}="DM_SUBSYSTEM_UDEV_FLAG1"
> +ACTION=="add", IMPORT{db}="DM_SUBSYSTEM_UDEV_FLAG1"
>  ENV{DM_SUBSYSTEM_UDEV_FLAG1}=="1", GOTO="mpath_kpartx_end"
>  
>  # 11-dm-mpath.rules sets MPATH_UNCHANGED for events that can be ignored.
> -- 
> 2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

