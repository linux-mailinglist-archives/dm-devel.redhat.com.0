Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBD91EC44C
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jun 2020 23:25:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591133105;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N/hpVTSRurfhnn6PonKmRRvYhB4qNq3ZMiTL04bP8Uw=;
	b=QZaWn8mP2tXPpmsJUuV5F+GMHadtdmh3MfGo570g6/WdWlMOg6oK7YnIs7p9YiWMJKS2wB
	J7+L3trd9zhFeWpFcoEFu4BnBSdbrjOBPMlShtPUCUZm1uyBuQd0762D5bl5H97GvnLkHS
	WvcZrIpfoj/hdBC9kKzsIM8z138LDGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-b1f3Pt3iMFq78Zwqnt24Cw-1; Tue, 02 Jun 2020 17:25:01 -0400
X-MC-Unique: b1f3Pt3iMFq78Zwqnt24Cw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25A191883604;
	Tue,  2 Jun 2020 21:24:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1686C1A927;
	Tue,  2 Jun 2020 21:24:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1AC749701F;
	Tue,  2 Jun 2020 21:24:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 052LLTgK017606 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 17:21:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 706CB10013D9; Tue,  2 Jun 2020 21:21:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03D0210013C0;
	Tue,  2 Jun 2020 21:21:23 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 052LLMR5005852; 
	Tue, 2 Jun 2020 16:21:22 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 052LLLaT005851;
	Tue, 2 Jun 2020 16:21:21 -0500
Date: Tue, 2 Jun 2020 16:21:21 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200602212121.GA3266@octiron.msp.redhat.com>
References: <20200602155443.14072-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200602155443.14072-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] 11-dm-mpath.rules: Fix udev rule processing
 during coldplug
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jun 02, 2020 at 05:54:43PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> DM_SUBSYSTEM_UDEV_FLAG0 is used to indicate that upper layer
> udev rules don't need to be processed for multipath maps, e.g.
> for map reloads.
> 
> However, this can fail if maps were created during initrd processing,
> but udev processing for the change events of these maps didn't
> complete because udevd was killed to switch root. So, in the coldplug
> case, play safe and process the rules once more.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> ---
>  multipath/11-dm-mpath.rules | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/multipath/11-dm-mpath.rules b/multipath/11-dm-mpath.rules
> index cd522e8c..34c21fd1 100644
> --- a/multipath/11-dm-mpath.rules
> +++ b/multipath/11-dm-mpath.rules
> @@ -52,8 +52,13 @@ LABEL="mpath_action"
>  # something that should be reacted upon since it would be useless extra work.
>  # It's exactly mpath's job to provide *seamless* device access to any of the
>  # paths that are available underneath.
> +# Exception: On cold-plug, if the map had already been set up before,
> +# do process upper layers, because rule processing may not necessarily have
> +# completed during initrd processing.
> +ACTION=="add", ENV{.MPATH_DEVICE_READY_OLD}=="1", GOTO="process_reload"
>  ENV{DM_SUBSYSTEM_UDEV_FLAG0}=="1", \
>  	ENV{DM_ACTIVATION}="0", ENV{MPATH_UNCHANGED}="1"
> +LABEL="process_reload"
>  
>  # For path failed or reinstated events, unset DM_ACTIVATION.
>  # This is similar to the DM_SUBSYSTEM_UDEV_FLAG0 case above.
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

