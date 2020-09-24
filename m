Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABAA277AE3
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 23:03:35 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600981415;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UbbLtD2f3iaYqt50HOv45XG0+gpUVNMogQIfQ4Jngpo=;
	b=JbMp1+1NfXPHHXC75spB3P6bRLNrNPVKXUrabE+vB3bdmzwagFZ8aOTIfEV2H8bFxa8oOb
	46iSDO3aUVQvKQRQ1uZUG6ix3HC75XvgLCsxO5FfuaeUQADMsIcdUBmrT49KaFikagBXJI
	zhPDO79xmERBa0sICKoUf955erKhFnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-u3FDhWHvNfWlIBRATIl5zA-1; Thu, 24 Sep 2020 17:03:32 -0400
X-MC-Unique: u3FDhWHvNfWlIBRATIl5zA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4E481891E80;
	Thu, 24 Sep 2020 21:03:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2227A9CBA;
	Thu, 24 Sep 2020 21:03:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC94879DD6;
	Thu, 24 Sep 2020 21:03:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OKwZJp015123 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 16:58:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 76A085C1DC; Thu, 24 Sep 2020 20:58:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 509DA5C1C7;
	Thu, 24 Sep 2020 20:58:32 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08OKwUZ9023316; 
	Thu, 24 Sep 2020 15:58:31 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08OKwUlW023315;
	Thu, 24 Sep 2020 15:58:30 -0500
Date: Thu, 24 Sep 2020 15:58:30 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200924205830.GJ11108@octiron.msp.redhat.com>
References: <20200924134054.14632-1-mwilck@suse.com>
	<20200924134054.14632-24-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200924134054.14632-24-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 23/23] multipath-tools: mpath-tools.supp:
 file with valgrind suppressions
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24, 2020 at 03:40:54PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 

Git complains about the extra blank line at the end of the file

third-party/valgrind/mpath-tools.supp:33: new blank line at EOF.

-Ben

> These leaks are caused by other libraries (libsystemd, glibc,
> libgcrypt) and should be ignored when debugging with valgrind
> 
> Usage example:
> 
> valgrind --suppressions=mpath-tools.supp \
>     --leak-check=full --show-leak-kinds=all $COMMAND
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  third-party/valgrind/mpath-tools.supp | 33 +++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 third-party/valgrind/mpath-tools.supp
> 
> diff --git a/third-party/valgrind/mpath-tools.supp b/third-party/valgrind/mpath-tools.supp
> new file mode 100644
> index 0000000..621463a
> --- /dev/null
> +++ b/third-party/valgrind/mpath-tools.supp
> @@ -0,0 +1,33 @@
> +{
> +   glibc _dlerror_run leak: https://stackoverflow.com/questions/1542457/memory-leak-reported-by-valgrind-in-dlopen
> +   Memcheck:Leak
> +   match-leak-kinds: reachable
> +   fun:calloc
> +   fun:_dlerror_run
> +   fun:dlopen*
> +}
> +
> +{
> +   systemd mempools are never freed: https://bugzilla.redhat.com/show_bug.cgi?id=1215670
> +   Memcheck:Leak
> +   match-leak-kinds: reachable
> +   fun:malloc
> +   fun:mempool_alloc_tile
> +   fun:mempool_alloc0_tile
> +   fun:hashmap_base_new
> +   fun:hashmap_base_ensure_allocated
> +}
> +
> +{
> +   libgcrypt library initialization
> +   Memcheck:Leak
> +   match-leak-kinds: reachable
> +   fun:malloc
> +   ...
> +   fun:_gcry_xmalloc
> +   ...
> +   fun:global_init.*
> +   ...
> +   fun:_dl_init
> +}
> +
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

