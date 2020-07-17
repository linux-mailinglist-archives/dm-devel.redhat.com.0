Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 93968224638
	for <lists+dm-devel@lfdr.de>; Sat, 18 Jul 2020 00:21:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595024506;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mqByHJ5s2RMF4elxSUD4qvGY75RA7G0fYhBBSwOhcUc=;
	b=A1uNepI7TjVlcZp2+kPwEXUAclQP+S6i4v1PGvdmbcNFN2dDeWsS6UzMlVsw/U8gV3fzVD
	2EDfQ43yQEfdvEmOOCWNJKn+iL0DuOhJt54aZfeqhEg+b/lpGYktLIeWw3wmAXzKqJw8Lm
	g3S4TcpZYs+PSDth+arzAaX95RdoxTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-3QPf3xD7P7KAhj5BBGP49w-1; Fri, 17 Jul 2020 18:21:43 -0400
X-MC-Unique: 3QPf3xD7P7KAhj5BBGP49w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B355B108C;
	Fri, 17 Jul 2020 22:21:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A4875FC2E;
	Fri, 17 Jul 2020 22:21:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E3B61809554;
	Fri, 17 Jul 2020 22:21:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06HMLDPY028654 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jul 2020 18:21:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1736D1EA; Fri, 17 Jul 2020 22:21:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A01A61100;
	Fri, 17 Jul 2020 22:21:09 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06HML8n5030725; 
	Fri, 17 Jul 2020 17:21:08 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06HML8Wn030724;
	Fri, 17 Jul 2020 17:21:08 -0500
Date: Fri, 17 Jul 2020 17:21:08 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200717222108.GS11089@octiron.msp.redhat.com>
References: <20200709103623.8302-1-mwilck@suse.com>
	<20200709103623.8302-5-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200709103623.8302-5-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 46/54] libmultipath: path_discover(): always
 set DI_BLACKLIST
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 09, 2020 at 12:36:15PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Since 65e1845 ("multipath: call store_pathinfo with DI_BLACKLIST"), we
> use DI_BLACKLIST for new paths. There's no reason why we shouldn't do the
> same with paths which are (unexpectedly) already in pathvec. As argued
> for 65e1845, this might save some unnecessary work for paths which are
> blacklisted anyway.

It seems to me like either we should assume that if we added the path to
pathvec, it's valid, or we should check, and if it's blacklisted, remove
it. Just leaving it on pathvec without all of the pathinfo work done
doesn't make much sense to me. Am I missing something here?

-Ben
 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/discovery.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> index 5f4ebf0..caabfef 100644
> --- a/libmultipath/discovery.c
> +++ b/libmultipath/discovery.c
> @@ -137,7 +137,7 @@ path_discover (vector pathvec, struct config * conf,
>  				      udevice, flag | DI_BLACKLIST,
>  				      NULL);
>  	else
> -		return pathinfo(pp, conf, flag);
> +		return pathinfo(pp, conf, flag | DI_BLACKLIST);
>  }
>  
>  static void cleanup_udev_enumerate_ptr(void *arg)
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

