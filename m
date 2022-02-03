Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B29204A7CFD
	for <lists+dm-devel@lfdr.de>; Thu,  3 Feb 2022 01:44:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643849077;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zN1JbhhZJr1fqiAiGER6GZl6igV0R4Rnyz72QH1qn+Y=;
	b=c999t399S65XQHqs781k+Fhpr+Hx+N5/lr7ZA52vALzWpRSjHoHQGxj0OddY8yx8SQyj2i
	vObyInkUz07UedMhxe+icY+whAqzPhc23Sl0I/iCJEAmwahaZawc1dfw4BrxA2Wu7FdWdJ
	/nI7K215tXglsqx1xVUYBSjwVZToZOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-zz1p_83IOayJ2jfJrxdMMQ-1; Wed, 02 Feb 2022 19:44:35 -0500
X-MC-Unique: zz1p_83IOayJ2jfJrxdMMQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57FE98144E3;
	Thu,  3 Feb 2022 00:44:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25A105E4AF;
	Thu,  3 Feb 2022 00:44:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A391B1806D03;
	Thu,  3 Feb 2022 00:44:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 2130eZVo003690 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Feb 2022 19:40:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 176674EDC1; Thu,  3 Feb 2022 00:40:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B27C65ED58;
	Thu,  3 Feb 2022 00:40:20 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 2130eJ3F027442; 
	Wed, 2 Feb 2022 18:40:19 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 2130eILJ027441;
	Wed, 2 Feb 2022 18:40:18 -0600
Date: Wed, 2 Feb 2022 18:40:18 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20220203004018.GT24684@octiron.msp.redhat.com>
References: <20220201234024.27675-1-mwilck@suse.com>
	<20220201234024.27675-5-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20220201234024.27675-5-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 4/6] multipathd.service: drop ExecStartPre
 for loading dm-multipath
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

On Wed, Feb 02, 2022 at 12:40:22AM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> As we install a modules-load.d file now, no need to call modprobe
> in ExecStartPre any more.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  multipathd/multipathd.service | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/multipathd/multipathd.service b/multipathd/multipathd.service
> index ae98034..aec62db 100644
> --- a/multipathd/multipathd.service
> +++ b/multipathd/multipathd.service
> @@ -16,7 +16,6 @@ ConditionVirtualization=!container
>  [Service]
>  Type=notify
>  NotifyAccess=main
> -ExecStartPre=-/sbin/modprobe dm-multipath
>  ExecStart=/sbin/multipathd -d -s
>  ExecReload=/sbin/multipathd reconfigure
>  TasksMax=infinity
> -- 
> 2.34.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

