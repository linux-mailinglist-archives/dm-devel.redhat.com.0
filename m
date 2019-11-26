Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4E210A54C
	for <lists+dm-devel@lfdr.de>; Tue, 26 Nov 2019 21:16:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574799406;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UG1LL6wREGssR9TDEqOpJzGu3R5iJKz9eF/E7Uf+Xtw=;
	b=E++4RUHEK6Yy5WeJTNckKL8d/Nqt+EXablKviIorYhT9t1hdSTz8ZB8lCOwY0x/CrK4DDe
	0Btae0yDulwOPhmnCRT5Dcneigd/b4RW5U9rgpN/42O1R/CeHbGBFrCNJtFlVNvCq6Yvcm
	rpSJjFuyvvNgeer0cASlS/ykCNcJARw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-JZrPCcp0PZeX9tEvXuE_qQ-1; Tue, 26 Nov 2019 15:16:44 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24EFA80183C;
	Tue, 26 Nov 2019 20:16:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F388160BEC;
	Tue, 26 Nov 2019 20:16:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6FCE318089CD;
	Tue, 26 Nov 2019 20:16:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAQKGHsl024969 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 26 Nov 2019 15:16:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DB4725D9CD; Tue, 26 Nov 2019 20:16:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06A135D9CA;
	Tue, 26 Nov 2019 20:16:14 +0000 (UTC)
Date: Tue, 26 Nov 2019 15:16:13 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Message-ID: <20191126201613.GA3750@redhat.com>
References: <20191126185627.970-1-geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <20191126185627.970-1-geert+renesas@glider.be>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Nikos Tsironis <ntsironis@arrikto.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ilias Tsitsimpis <iliastsi@arrikto.com>, dm-devel@redhat.com,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] docs: device-mapper: Add dm-clone to documentation
	index
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: JZrPCcp0PZeX9tEvXuE_qQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Nov 26 2019 at  1:56pm -0500,
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> When the dm-clone documentation was added, it was not added to the
> documentation index, leading to a warning when building the
> documentation:
> 
>     Documentation/admin-guide/device-mapper/dm-clone.rst: WARNING: document isn't included in any toctree
> 
> Fixes: 7431b7835f554f86 ("dm: add clone target")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/admin-guide/device-mapper/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/admin-guide/device-mapper/index.rst b/Documentation/admin-guide/device-mapper/index.rst
> index 4872fb6d29524593..ec62fcc8eeceed83 100644
> --- a/Documentation/admin-guide/device-mapper/index.rst
> +++ b/Documentation/admin-guide/device-mapper/index.rst
> @@ -8,6 +8,7 @@ Device Mapper
>      cache-policies
>      cache
>      delay
> +    dm-clone
>      dm-crypt
>      dm-dust
>      dm-flakey
> 

I already staged this for 5.5 here:
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.5&id=484e0d2b11e1fdd0d17702b282eb2ed56148385f

But I don't plan to send to Linus for a week or 2...

If Jon and/or someone else would like to send it along before then
that'd be fine with me.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

