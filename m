Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 49C9824D3C1
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 13:19:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-Au967UBFO6y_RGKSyKUSnQ-1; Fri, 21 Aug 2020 07:19:12 -0400
X-MC-Unique: Au967UBFO6y_RGKSyKUSnQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4F2B1DE15;
	Fri, 21 Aug 2020 11:19:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 697D71014183;
	Fri, 21 Aug 2020 11:19:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A01B3181A06B;
	Fri, 21 Aug 2020 11:19:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LBIxAp015430 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 07:19:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C9EC51111A4F; Fri, 21 Aug 2020 11:18:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5C781111A4E
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 11:18:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4F02101AA40
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 11:18:57 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-179-69jKb0kcN7e4t7crCrB5rQ-1;
	Fri, 21 Aug 2020 07:18:53 -0400
X-MC-Unique: 69jKb0kcN7e4t7crCrB5rQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 86585AD04;
	Fri, 21 Aug 2020 11:19:19 +0000 (UTC)
Message-ID: <464a716fb1598b8859c3441bf09b1146e49675bb.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
Date: Fri, 21 Aug 2020 13:18:50 +0200
In-Reply-To: <ab034ec7-c80d-6d40-b9bf-1942e2ad5067@huawei.com>
References: <52b3b834-6da6-99c1-a2d1-95c2387c47e3@huawei.com>
	<ab034ec7-c80d-6d40-b9bf-1942e2ad5067@huawei.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: Re: [dm-devel] [PATCH V2 5/5] multipathd: remove useless memset
 after MALLOC in alloc_waiteri func
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-08-21 at 19:01 +0800, Zhiqiang Liu wrote:
> MALLOC(x) maps to calloc(1, x), which already init var to zero.
> In alloc_waiter func, the superfluous memset(wp) call is useless,
> and it should be removed.
> 
> V1->V2:
> - remove useless memset call after MALLOC (as suggested by Martin)

Reading this, I realize that we don't need alloc_waiter() at all.
Anyway:

Reviewed-by: Martin Wilck <mwilck@suse.com>

> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
>  multipathd/waiter.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/multipathd/waiter.c b/multipathd/waiter.c
> index e6457663..da4017b9 100644
> --- a/multipathd/waiter.c
> +++ b/multipathd/waiter.c
> @@ -29,13 +29,7 @@ struct mutex_lock waiter_lock = { .mutex =
> PTHREAD_MUTEX_INITIALIZER };
> 
>  static struct event_thread *alloc_waiter (void)
>  {
> -
> -	struct event_thread *wp;
> -
> -	wp = (struct event_thread *)MALLOC(sizeof(struct
> event_thread));
> -	memset(wp, 0, sizeof(struct event_thread));
> -
> -	return wp;
> +	return (struct event_thread *)MALLOC(sizeof(struct
> event_thread));
>  }
> 
>  static void free_waiter (void *data)


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

