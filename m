Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B2A77233B33
	for <lists+dm-devel@lfdr.de>; Fri, 31 Jul 2020 00:20:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596147615;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fqV08WgRxFGVS4YEQdJT0gqxjsgmueg4+rTyn6+cqwA=;
	b=anDk25yTX37O6ePJq7FMDotvyHTdJYUyP/+u3lkoUpsS6M+ACCOE5x90JQSOuDTvTIzPue
	PNfcb+88d+LN6Q81JXCR2CPmyo0aMGTHsJQkLGuv9RIAjXSVXwkLiQ0HghkNqf8Ej74aTZ
	lJpQzfuSiSE6AC0Sh1oimmtDOvTy8Rc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-4OjSDY_VNcW4AYfucaTzmQ-1; Thu, 30 Jul 2020 18:20:08 -0400
X-MC-Unique: 4OjSDY_VNcW4AYfucaTzmQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB5E957;
	Thu, 30 Jul 2020 22:19:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38D7987B1E;
	Thu, 30 Jul 2020 22:19:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E2DCF1809554;
	Thu, 30 Jul 2020 22:19:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06UMGQZT021236 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 30 Jul 2020 18:16:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2DC4D19D7B; Thu, 30 Jul 2020 22:16:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31A671992D;
	Thu, 30 Jul 2020 22:16:22 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06UMGK7f028260; 
	Thu, 30 Jul 2020 17:16:20 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06UMGK0d028259;
	Thu, 30 Jul 2020 17:16:20 -0500
Date: Thu, 30 Jul 2020 17:16:20 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <20200730221620.GC19233@octiron.msp.redhat.com>
References: <0cbfeea7-5f30-a148-555b-19af2429c32c@huawei.com>
MIME-Version: 1.0
In-Reply-To: <0cbfeea7-5f30-a148-555b-19af2429c32c@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, dm-devel@redhat.com,
	lixiaokeng <lixiaokeng@huawei.com>, Martin Wilck <mwilck@suse.com>
Subject: Re: [dm-devel] [PATCH] devmapper: remove useless using of memset in
 dm_get_info func
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 30, 2020 at 10:06:35PM +0800, Zhiqiang Liu wrote:
> 
> In dm_get_info func, if do_get_info fails, we donot need to
> call memset to assign 0 to *dmi which will be freed.
> 
> Here, we remove the useless using of memset in dm_get_info func.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/devmapper.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> index f597ff8b..00ee0dfc 100644
> --- a/libmultipath/devmapper.c
> +++ b/libmultipath/devmapper.c
> @@ -1464,7 +1464,6 @@ dm_get_info (const char * mapname, struct dm_info ** dmi)
>  		return 1;
> 
>  	if (do_get_info(mapname, *dmi) != 0) {
> -		memset(*dmi, 0, sizeof(struct dm_info));
>  		FREE(*dmi);
>  		*dmi = NULL;
>  		return 1;
> -- 
> 2.24.0.windows.2
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

