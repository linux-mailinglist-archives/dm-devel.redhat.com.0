Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0E70D2248A4
	for <lists+dm-devel@lfdr.de>; Sat, 18 Jul 2020 06:29:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595046566;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oj+B4NG7OH4BPwuSuYde5iQCJx2kyV7Q1TFrG6QJ1pk=;
	b=hhZ978DY5e/l+I3H3Irl8IO9c9mMKju4X5822kfZE8GMFHmWdseFFEDWLSfiBZUSUO3AzR
	2vGIvdWoiFtbxg5oORVSbOE9jgdJF1vt7PTu1Tqaud2KMOLOP+lWLGPMTbYaitJiC90VoQ
	kUHtngh94Q2xRGOQVrp3OkraumsrJeA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-_THwEhQaNK2WOWpuxNj1Ew-1; Sat, 18 Jul 2020 00:29:23 -0400
X-MC-Unique: _THwEhQaNK2WOWpuxNj1Ew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 294045EB;
	Sat, 18 Jul 2020 04:29:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D43772AF8;
	Sat, 18 Jul 2020 04:29:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A87E94EE5;
	Sat, 18 Jul 2020 04:28:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06I4SmHD006953 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 18 Jul 2020 00:28:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 581237B42B; Sat, 18 Jul 2020 04:28:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F64279D1D;
	Sat, 18 Jul 2020 04:28:45 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06I4Sh6J032283; 
	Fri, 17 Jul 2020 23:28:43 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06I4Saum032282;
	Fri, 17 Jul 2020 23:28:36 -0500
Date: Fri, 17 Jul 2020 23:28:36 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200718042836.GT11089@octiron.msp.redhat.com>
References: <20200709105145.9211-1-mwilck@suse.com>
	<20200709105145.9211-9-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200709105145.9211-9-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 61/74] libmultipath: adopt_paths(): skip
	removed paths
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 09, 2020 at 12:51:32PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> If we don't do this, pathinfo() will fail on these paths, causing
> adopt_paths() to fail.
> 

This is probably unnecessary, but it seems safer to make sure that
pp->mpp is set to mpp, before bailing out on removed paths.

-Ben

> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/structs_vec.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> index 7c68592..1e0f109 100644
> --- a/libmultipath/structs_vec.c
> +++ b/libmultipath/structs_vec.c
> @@ -79,6 +79,8 @@ int adopt_paths(vector pathvec, struct multipath *mpp)
>  					pp->dev, mpp->alias);
>  				continue;
>  			}
> +			if (pp->initialized == INIT_REMOVED)
> +				continue;
>  			condlog(3, "%s: ownership set to %s",
>  				pp->dev, mpp->alias);
>  			pp->mpp = mpp;
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

