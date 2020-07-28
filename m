Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CA236230F17
	for <lists+dm-devel@lfdr.de>; Tue, 28 Jul 2020 18:20:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595953241;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tiEHUflBTPGYiBsfdduLLzWho757xtCnspKTnG2HnZs=;
	b=Wwmb87qQ2Yo7H4uVKuVEfF4/EtV4pSgYOUzenB8inGQdXZnBGGvwp0Ww/EQJySeMmO8tAv
	vCp3sMDUVz5lqKebU9iMwQp/8puYfl3vFl7MdYp9YxfVYzphc8UBkh9P9UO8BRw9XWJaAZ
	WnN/D240wD3n84qr1sANrTQKVKFUI1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-AH145pkjMgGnuE5WPCfMAQ-1; Tue, 28 Jul 2020 12:20:37 -0400
X-MC-Unique: AH145pkjMgGnuE5WPCfMAQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F92A1800D4A;
	Tue, 28 Jul 2020 16:20:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CE50108D3;
	Tue, 28 Jul 2020 16:20:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 22D2CA35AC;
	Tue, 28 Jul 2020 16:20:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06SGKAYe004420 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 12:20:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 015457B41F; Tue, 28 Jul 2020 16:20:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C85FE90E70;
	Tue, 28 Jul 2020 16:20:03 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06SGK2pZ011987; 
	Tue, 28 Jul 2020 11:20:02 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06SGK0WE011986;
	Tue, 28 Jul 2020 11:20:00 -0500
Date: Tue, 28 Jul 2020 11:20:00 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <20200728162000.GP11089@octiron.msp.redhat.com>
References: <9bc76686-747f-e85b-d25f-db5a056cf869@huawei.com>
MIME-Version: 1.0
In-Reply-To: <9bc76686-747f-e85b-d25f-db5a056cf869@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Yanxiaodan <yanxiaodan@huawei.com>, linfeilong@huawei.com,
	dm-devel@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>, mwilck@suse.com
Subject: Re: [dm-devel] [PATCH] libmultipath: fix a memory leak in
 disassemble_status func
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jul 28, 2020 at 09:48:06PM +0800, Zhiqiang Liu wrote:
> 
> In disassemble_status func, for dealing with selector args,
> word is allocated by get_word func. However, word is not freed.
> Then a memory leak occurs.
> 
> Here, we call FREE(word) to free word.

Err... At the risk of sounding stupid, There is a least-pending
selector?  Hannes, you added this code (commit 35ad40b4 "leastpending IO
loadbalancing is not displayed properly"). Was this a Suse thing?  Is it
still a Suse thing, or have queue-length and service-time replaced it?

At any rate, for the patch itself (assuming that the correct answer
isn't to just delete the least-pending code),

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
>  libmultipath/dmparser.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
> index 3dc77242..a4a989b2 100644
> --- a/libmultipath/dmparser.c
> +++ b/libmultipath/dmparser.c
> @@ -584,6 +584,7 @@ int disassemble_status(char *params, struct multipath *mpp)
>  						   &def_minio) == 1 &&
>  					    def_minio != mpp->minio)
>  							mpp->minio = def_minio;
> +					FREE(word);
>  				} else
>  					p += get_word(p, NULL);
>  			}
> -- 
> 2.24.0.windows.2
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

