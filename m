Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9981C4668F6
	for <lists+dm-devel@lfdr.de>; Thu,  2 Dec 2021 18:17:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638465428;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MVUjk+JaIGvTsdNJHuzsE+jL1C/TTKt0bkNy+0xtfQo=;
	b=MBjZ0MoTj2eZSr/qgkqVW0LXFqp3yLhQsmxBzpotDmxtuo3U7tfpvdRWytKHh4Lgn8e93m
	xzGYAt9clT1Np+nCfkZDZ+VOg2PwPuk1CdSh5NSU54zH44bMbPwkxHQGIVqDRizxTziBQF
	W1sII7UjGbraonmuwcrliuuKw8hKuYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-238-2Lw2HI-wPr-QH-W0ao24bA-1; Thu, 02 Dec 2021 12:17:05 -0500
X-MC-Unique: 2Lw2HI-wPr-QH-W0ao24bA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E5A681EE82;
	Thu,  2 Dec 2021 17:16:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 105CB45D65;
	Thu,  2 Dec 2021 17:16:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85F9B4BB7C;
	Thu,  2 Dec 2021 17:16:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B2HGYdK013715 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Dec 2021 12:16:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 172C919729; Thu,  2 Dec 2021 17:16:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0665419C46;
	Thu,  2 Dec 2021 17:16:26 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1B2HGPnw013617; 
	Thu, 2 Dec 2021 11:16:25 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1B2HGOnP013616;
	Thu, 2 Dec 2021 11:16:24 -0600
Date: Thu, 2 Dec 2021 11:16:24 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20211202171624.GT19591@octiron.msp.redhat.com>
References: <20211202104812.27529-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20211202104812.27529-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] multipathd.service: add dependency on
 systemd-udevd-kernel.socket
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 02, 2021 at 11:48:12AM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Since f42d918 ("multipathd: Remove dependency on
> systemd-udev-settle.service"), multipathd has no dependencies on
> udev any more. In reality, multipathd depends quite heavily on udev.
> 
> multipathd startup succeeds indeed if udevd isn't running. Connecting to the
> udev monitor netlink socket works, too, and if udevd is started later on,
> multipathd will receive events over this socket. multipathd doesn't connect to
> the udev control socket, but it does attempt to trigger uevents using
> sysfs. For these events to be processed, the udev kernel socket must be
> listening. For that, it's sufficient to depend on systemd-udevd-kernel.socket,
> which will start udevd on demand if it isn't running.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> 
> ---
> Note: I'd like to get this merged into the current upstream PR.
> ---
>  multipathd/multipathd.service | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/multipathd/multipathd.service b/multipathd/multipathd.service
> index 87cb534..1919b38 100644
> --- a/multipathd/multipathd.service
> +++ b/multipathd/multipathd.service
> @@ -2,6 +2,8 @@
>  Description=Device-Mapper Multipath Device Controller
>  Before=iscsi.service iscsid.service lvm2-activation-early.service
>  Before=local-fs-pre.target blk-availability.service shutdown.target
> +Wants=systemd-udevd-kernel.socket
> +After=systemd-udevd-kernel.socket
>  After=multipathd.socket systemd-remount-fs.service
>  DefaultDependencies=no
>  Conflicts=shutdown.target
> -- 
> 2.34.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

