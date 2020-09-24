Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C8761277A7A
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 22:31:28 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600979487;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Nqyf+enFpnwbRT0GuXr/24SAGyOQExXHY0I88eCzbBs=;
	b=GuhrqO0VlQh9Egn+Lg4/vPSXjFKo+FvGXREq1HW8U9loSNBgIALgvJ2CZCksyPtDhJTEdV
	usj/IIr9BwzWusrOAw/w74LoarLRC1jvKR6WaLWkLyLlTetidYrzTb91JC94k6DS3Wl1gc
	yBnKWM8nGS82qZJuRd11ZZTCNlcJbbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-bh6o_Uk9MtmyG8dErFERqA-1; Thu, 24 Sep 2020 16:31:25 -0400
X-MC-Unique: bh6o_Uk9MtmyG8dErFERqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76FFB802EA5;
	Thu, 24 Sep 2020 20:31:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB72619C66;
	Thu, 24 Sep 2020 20:31:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 284198C7A1;
	Thu, 24 Sep 2020 20:31:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OKRKZh012699 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 16:27:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AEDFC73684; Thu, 24 Sep 2020 20:27:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B379673697;
	Thu, 24 Sep 2020 20:27:16 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08OKRFMI023285; 
	Thu, 24 Sep 2020 15:27:15 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08OKRFxN023284;
	Thu, 24 Sep 2020 15:27:15 -0500
Date: Thu, 24 Sep 2020 15:27:14 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200924202714.GI11108@octiron.msp.redhat.com>
References: <20200924133644.14034-1-mwilck@suse.com>
	<20200924133644.14034-7-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200924133644.14034-7-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 06/11] libmultipath: checkers/prio: allow
 non-lazy .so loading
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

On Thu, Sep 24, 2020 at 03:36:39PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> If compiled with -DLOAD_ALL_SHARED_LIBS, all known prioritizers
> and checkers will be loaded immediately on startup. This is useful
> for determining symbol usage (start executables with LD_BIND_NOW=1).

It seems like you could avoid having to remember to update these arrays
when new checker or prio DSOs are added by just scanning multipath_dir
for all the existing checkers/prioritizers.  On the flip side, I'm not
sure that's worth the extra work, and this way has the benefit of
warning if any expected chekers/priotitizers are missing, so

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> ---
>  libmultipath/checkers.c | 17 +++++++++++++++++
>  libmultipath/prio.c     | 22 ++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/libmultipath/checkers.c b/libmultipath/checkers.c
> index f7ddd53..18b1f5e 100644
> --- a/libmultipath/checkers.c
> +++ b/libmultipath/checkers.c
> @@ -7,6 +7,7 @@
>  #include "debug.h"
>  #include "checkers.h"
>  #include "vector.h"
> +#include "util.h"
>  
>  struct checker_class {
>  	struct list_head node;
> @@ -375,7 +376,23 @@ void checker_get(const char *multipath_dir, struct checker *dst,
>  
>  int init_checkers(const char *multipath_dir)
>  {
> +#ifdef LOAD_ALL_SHARED_LIBS
> +	static const char *const all_checkers[] = {
> +		DIRECTIO,
> +		TUR,
> +		HP_SW,
> +		RDAC,
> +		EMC_CLARIION,
> +		READSECTOR0,
> +		CCISS_TUR,
> +	};
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(all_checkers); i++)
> +		add_checker_class(multipath_dir, all_checkers[i]);
> +#else
>  	if (!add_checker_class(multipath_dir, DEFAULT_CHECKER))
>  		return 1;
> +#endif
>  	return 0;
>  }
> diff --git a/libmultipath/prio.c b/libmultipath/prio.c
> index 3a718ba..c92bde7 100644
> --- a/libmultipath/prio.c
> +++ b/libmultipath/prio.c
> @@ -20,8 +20,30 @@ unsigned int get_prio_timeout(unsigned int timeout_ms,
>  
>  int init_prio (const char *multipath_dir)
>  {
> +#ifdef LOAD_ALL_SHARED_LIBS
> +	static const char *const all_prios[] = {
> +		PRIO_ALUA,
> +		PRIO_CONST,
> +		PRIO_DATACORE,
> +		PRIO_EMC,
> +		PRIO_HDS,
> +		PRIO_HP_SW,
> +		PRIO_ONTAP,
> +		PRIO_RANDOM,
> +		PRIO_RDAC,
> +		PRIO_WEIGHTED_PATH,
> +		PRIO_SYSFS,
> +		PRIO_PATH_LATENCY,
> +		PRIO_ANA,
> +	};
> +	unsigned int i;
> +
> +	for  (i = 0; i < ARRAY_SIZE(all_prios); i++)
> +		add_prio(multipath_dir, all_prios[i]);
> +#else
>  	if (!add_prio(multipath_dir, DEFAULT_PRIO))
>  		return 1;
> +#endif
>  	return 0;
>  }
>  
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

