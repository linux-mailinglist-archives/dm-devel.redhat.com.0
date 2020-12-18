Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD2B2DEBE7
	for <lists+dm-devel@lfdr.de>; Sat, 19 Dec 2020 00:21:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608333665;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+yv7x9Ig3fA9DvNkLfo4j4Z806XG+7txzN3Qud/PPis=;
	b=cooOFO1pWZp4+ujRP1IXnu142XO/PnNB2vfmPe52ZjVLbXEkhRzH1S+Lqr46Fnkbl7ptXV
	sDiYLtYGAlukLTzBBzTe/wsdYP+UDxPz0PDXuX7o1J8mPWiYpwJoHd3S3s+bbZrRoekwDV
	8l6xKjA4t3zXSJBQo65GFg5CS3agoLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-HIlRnVs9P4S6CduCEc3tdw-1; Fri, 18 Dec 2020 18:20:57 -0500
X-MC-Unique: HIlRnVs9P4S6CduCEc3tdw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 599531005513;
	Fri, 18 Dec 2020 23:20:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34D9F299A1;
	Fri, 18 Dec 2020 23:20:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DEF0E180954D;
	Fri, 18 Dec 2020 23:20:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BINKnJX029625 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 18:20:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6CD672BFF1; Fri, 18 Dec 2020 23:20:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B6412C161;
	Fri, 18 Dec 2020 23:20:46 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0BINKjud010041; 
	Fri, 18 Dec 2020 17:20:45 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0BINKi3R010040;
	Fri, 18 Dec 2020 17:20:44 -0600
Date: Fri, 18 Dec 2020 17:20:44 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20201218232044.GR3103@octiron.msp.redhat.com>
References: <20201218223753.24451-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20201218223753.24451-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: Re: [dm-devel] [PATCH] libmultipath: fix format warning with clang
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 18, 2020 at 11:37:53PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Reported-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
> ---
>  libmultipath/log.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/libmultipath/log.c b/libmultipath/log.c
> index 6498c88..10fa32c 100644
> --- a/libmultipath/log.c
> +++ b/libmultipath/log.c
> @@ -125,6 +125,7 @@ void log_reset (char *program_name)
>  	pthread_cleanup_pop(1);
>  }
>  
> +__attribute__((format(printf, 2, 0)))
>  static int _log_enqueue(int prio, const char * fmt, va_list ap)
>  {
>  	int len, fwd;
> -- 
> 2.29.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

