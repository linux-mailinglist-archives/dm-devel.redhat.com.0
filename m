Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E23F125E244
	for <lists+dm-devel@lfdr.de>; Fri,  4 Sep 2020 22:01:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599249716;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XJ44yBL/n2gHAUoBCZWrIv6soIumB4cKndgSlQHNA3c=;
	b=ee0Bz65u0HAbPbAZSRXzD7+GnmCBK+dT6SnRErdPskWDneP6nLDQYF6Xd+xEcKiTS2Vvgp
	zYAnBnqNgwvImEq8J31333bDU+3npr8B/HSk6ANhWV5dPrIQ3WTAJ6xNn2dShSSn5Gmmfh
	egN01wBkcm5EkqQa2Xu5armshiYbftU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-enZ-7IXQO8GjmnMMxCIz1g-1; Fri, 04 Sep 2020 16:01:54 -0400
X-MC-Unique: enZ-7IXQO8GjmnMMxCIz1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2DCE190A3F7;
	Fri,  4 Sep 2020 20:01:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0112D7E418;
	Fri,  4 Sep 2020 20:01:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6621318561B2;
	Fri,  4 Sep 2020 20:01:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084K0bJA014690 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 16:00:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E03B67ED93; Fri,  4 Sep 2020 20:00:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FA607EDA8;
	Fri,  4 Sep 2020 20:00:34 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 084K0Xuw024788; 
	Fri, 4 Sep 2020 15:00:33 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 084K0XfW024787;
	Fri, 4 Sep 2020 15:00:33 -0500
Date: Fri, 4 Sep 2020 15:00:32 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200904200032.GB11108@octiron.msp.redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<73d14f51e1ca6aeb8dbd40f5a22c21508b6d4401.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <73d14f51e1ca6aeb8dbd40f5a22c21508b6d4401.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: lixiaokeng <lixiaokeng@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 00/14] multipath-tools series: some cleanups
 and fixes checked by codedex tool
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Sep 03, 2020 at 10:08:53PM +0200, Martin Wilck wrote:
> Hello Lixiaokeng,
> 
> On Wed, 2020-09-02 at 14:40 +0800, lixiaokeng wrote:
> > Hi:
> >     Now, we check multipath-tools codes with codedex tool. Here
> > are some some cleanups and fixes.
> 
> Thank you. However I'm going to nack all patches that add error
> messages after unsuccesful memory allocations. Such messages are
> unhelpful most of the time, and increase the code size without a true
> benefit. I've actually considered to get rid of all these, and replace
> them by a log_oom() macro.

O.k. This answers my question from patch 0005. I'm fine with this.

As a side note: man, those are some ugly preprocessor hoops you need to
jump through to stringify __LINE__.

-Ben

> 
> See an untested prototype attached, to better understand what I mean.
> 
> Regards
> Martin
> 
> 

> From fbbca2c5076a489ee4ae643d6d9199ca5085be95 Mon Sep 17 00:00:00 2001
> From: Martin Wilck <mwilck@suse.com>
> Date: Thu, 3 Sep 2020 22:03:22 +0200
> Subject: [PATCH] libmultipath: prototype implementation of log_oom()
> 
> Rationale: with VERBOSE_OOM_LOGGING, we log the part of the code
> where OOM occured, with minimal runtime effort (no string formatting).
> With lots of log_oom() invocations, our binary will increase by many
> static strings. Without VERBOSE_OOM_LOGGING, we just print a minimal
> error message, which will be enough most of the time.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/debug.c | 7 +++++++
>  libmultipath/debug.h | 8 ++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/libmultipath/debug.c b/libmultipath/debug.c
> index 4128cb9..9062581 100644
> --- a/libmultipath/debug.c
> +++ b/libmultipath/debug.c
> @@ -48,3 +48,10 @@ void dlog (int sink, int prio, const char * fmt, ...)
>  	}
>  	va_end(ap);
>  }
> +
> +#ifndef VERBOSE_OOM_LOGGING
> +void log_oom(void)
> +{
> +	condlog(0, "Out of memory");
> +}
> +#endif
> diff --git a/libmultipath/debug.h b/libmultipath/debug.h
> index c6120c1..f61ecb6 100644
> --- a/libmultipath/debug.h
> +++ b/libmultipath/debug.h
> @@ -11,3 +11,11 @@ extern int logsink;
>  
>  #define condlog(prio, fmt, args...) \
>  	dlog(logsink, prio, fmt "\n", ##args)
> +
> +#ifdef VERBOSE_OOM_LOGGING
> +#define __log_oom(file, line) condlog(0, "Out of memory in " file ":" #line)
> +#define _log_oom(file, line) __log_oom(file, line)
> +#define log_oom() _log_oom(__FILE__, __LINE__)
> +#else
> +void log_oom(void);
> +#endif
> -- 
> 2.28.0
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

