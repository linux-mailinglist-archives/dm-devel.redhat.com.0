Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF1C446B12
	for <lists+dm-devel@lfdr.de>; Sat,  6 Nov 2021 00:02:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636153336;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=S3nTqY9+VdsJDo2Txc8BOYqZEqDB8UtaJu5FHpE92TI=;
	b=VM1ED158DBOgWy4lwux6y4liWvyMmHfwRMv5swqnJHOnqrsjWnqkGlJmgnwoofRLXw52Gy
	VfapYlhrxJtcldSquNH6+bLI9tBmwc0Ka4NWrhtA5ui43bYUFQ8ccMQw6QF3tqDZv9QyHJ
	pMu/sZWXPp55iXcaB/w63wJjCsp27v8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-tSXIZe5AMR2lgWxExFs-QA-1; Fri, 05 Nov 2021 19:02:14 -0400
X-MC-Unique: tSXIZe5AMR2lgWxExFs-QA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63D2736304;
	Fri,  5 Nov 2021 23:02:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2A26101E692;
	Fri,  5 Nov 2021 23:01:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8CEF4A702;
	Fri,  5 Nov 2021 23:01:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A5N0WgG002018 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Nov 2021 19:00:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D9DDD5F4EC; Fri,  5 Nov 2021 23:00:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24C205F4F5;
	Fri,  5 Nov 2021 23:00:29 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1A5N0Qhl013058; 
	Fri, 5 Nov 2021 18:00:27 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1A5N0QWS013057;
	Fri, 5 Nov 2021 18:00:26 -0500
Date: Fri, 5 Nov 2021 18:00:25 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20211105230025.GP19591@octiron.msp.redhat.com>
References: <20211105110127.19407-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20211105110127.19407-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] multipath: fix exit status of multipath -T
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

On Fri, Nov 05, 2021 at 12:01:27PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> We must set the return value in configure().
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  multipath/main.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/multipath/main.c b/multipath/main.c
> index 65ece83..b2d300e 100644
> --- a/multipath/main.c
> +++ b/multipath/main.c
> @@ -560,6 +560,7 @@ configure (struct config *conf, enum mpath_cmds cmd,
>  
>  		dump_config(conf, hwes, curmp);
>  		vector_free(hwes);
> +		r = RTVL_OK;
>  		goto out;
>  	}
>  
> -- 
> 2.33.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

