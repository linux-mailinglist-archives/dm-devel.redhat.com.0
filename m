Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D384A7D02
	for <lists+dm-devel@lfdr.de>; Thu,  3 Feb 2022 01:45:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643849146;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Of3omYS3wiQPXD1pn7OTRxXfVX3N9qyNxNTI/UyA0zM=;
	b=Sdqt9OUYzcgZX+yGRD/k8QnCn276Oc12hr9GSzqAFVUGwMm4b8sw8lkQsyDQ+pccavB9r4
	yPGAL85KR5ri39lKMyKGIABJCLUy9EI+LUDEw+qdFyIx1rog98qqIWJ1e3sXrWNJZWb04V
	u/3rbsj8c3AcYqPGUpufxqud1cF0mcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-SKHDyW-1M_yUz085-qtMIg-1; Wed, 02 Feb 2022 19:45:44 -0500
X-MC-Unique: SKHDyW-1M_yUz085-qtMIg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8127418A0F1C;
	Thu,  3 Feb 2022 00:45:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DC9D1053B20;
	Thu,  3 Feb 2022 00:45:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B7F684BB7C;
	Thu,  3 Feb 2022 00:45:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 2130e1HN003636 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Feb 2022 19:40:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 322065E4AC; Thu,  3 Feb 2022 00:40:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9503E5E4A9;
	Thu,  3 Feb 2022 00:39:43 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 2130dfk3027411; 
	Wed, 2 Feb 2022 18:39:42 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 2130df7H027409;
	Wed, 2 Feb 2022 18:39:41 -0600
Date: Wed, 2 Feb 2022 18:39:41 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20220203003941.GR24684@octiron.msp.redhat.com>
References: <20220201234024.27675-1-mwilck@suse.com>
	<20220201234024.27675-3-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20220201234024.27675-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 2/6] multipath-tools: Makefile.inc: delete
 obsolete comment
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 02, 2022 at 12:40:20AM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> We haven't used the options since 0.4.5.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  Makefile.inc | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/Makefile.inc b/Makefile.inc
> index a7d16df..c5f1fa5 100644
> --- a/Makefile.inc
> +++ b/Makefile.inc
> @@ -2,12 +2,6 @@
>  # Copyright (C) 2004 Christophe Varoqui, <christophe.varoqui@opensvc.com>
>  #
>  
> -#
> -# Allow to force some libraries to be used statically. (Uncomment one of the
> -# following lines or define the values when calling make.)
> -#
> -# WITH_LOCAL_LIBDM	= 1
> -# WITH_LOCAL_LIBSYSFS	= 1
>  #
>  # Uncomment to disable libdmmp support
>  # ENABLE_LIBDMMP = 0
> -- 
> 2.34.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

