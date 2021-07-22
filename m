Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6E53D2F50
	for <lists+dm-devel@lfdr.de>; Thu, 22 Jul 2021 23:44:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626990242;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n8mw9JKMQIt2vjYc9t7fgPCFDu9A9+JlXNnTyq7j/qQ=;
	b=YuQii4DmgrzeNkJHxjdLEkA38BYbvD0gM2E/zgG3jFkbI5nAo8CCQU/apSNW3NtN7PFUln
	2wy8YOZn9HOD1K4TH+0e0VA3WluyL9FTiqzccauyay5IaD7edM+xMdVju7DtxCSLD1leOs
	hozvDRQ3A64RYSVAQU0HoNp7Rbkivcc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-8tFOtzo-M5C__C7lVXsXlQ-1; Thu, 22 Jul 2021 17:44:00 -0400
X-MC-Unique: 8tFOtzo-M5C__C7lVXsXlQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CCB3801B1C;
	Thu, 22 Jul 2021 21:43:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFFC87A412;
	Thu, 22 Jul 2021 21:43:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6AC1B4BB7C;
	Thu, 22 Jul 2021 21:43:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16MLh26D022200 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 22 Jul 2021 17:43:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8C2B12719E; Thu, 22 Jul 2021 21:43:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E612326574;
	Thu, 22 Jul 2021 21:42:56 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 16MLgsvK020141; 
	Thu, 22 Jul 2021 16:42:54 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 16MLgshi020140;
	Thu, 22 Jul 2021 16:42:54 -0500
Date: Thu, 22 Jul 2021 16:42:53 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20210722214253.GC3087@octiron.msp.redhat.com>
References: <37767722-8e6c-4176-d234-87134c21cd4c@huawei.com>
MIME-Version: 1.0
In-Reply-To: <37767722-8e6c-4176-d234-87134c21cd4c@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [Question] multipathd.service start failed when
 /var/run isn't mount
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 22, 2021 at 10:51:22AM +0800, lixiaokeng wrote:
> When we enable multipathd.service with systemctl and reboot,
> multipathd doesn't start and log "failed to create pidfile".
> 
> The reason is following:
> 
> The RUN is /var/run in multipath-tools. When we start linux, we
> mount a disk to /var. So if multipathd.service start before mount,
> it will fail to activate.(If mount firstly, multipathd will start
> successfully)
> 
> The RUN is defined in Makefile.inc:
> 
> ifndef RUN
>         ifeq ($(shell test -L /var/run -o ! -d /var/run && echo 1),1)
>                 RUN=run
>         else
>                 RUN=var/run
>         endif
> endif
> 
> Can it always be defined as run?

I believe all modern distributions make /var/run a symlink to /run.
However, if that's the case, then I don't understand why you are running
into this issue at all, since multipath should be using /run. What
multipath packages are you using?

-Ben

> 
> Regards,
> Lixiaokeng

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

